#!/usr/bin/env node
import fs from 'node:fs/promises';
import path from 'node:path';

const url = process.argv[2] || process.env.APP_BASE_URL || 'http://localhost:3000';
const outDir = process.argv[3] || '.agent/browser-artifacts';

async function main() {
  console.log(`Browser check target: ${url}`);
  await fs.mkdir(outDir, { recursive: true });

  let chromium;
  try {
    const playwright = await import('playwright');
    chromium = playwright.chromium;
  } catch (error) {
    console.log('Playwright is not installed.');
    console.log('Install it in your app repo with: npm install -D playwright && npx playwright install chromium');
    console.log('No browser validation was performed.');
    process.exitCode = 2;
    return;
  }

  const browser = await chromium.launch({ headless: process.env.BROWSER_CHECK_HEADLESS !== 'false' });
  const page = await browser.newPage();
  const consoleErrors = [];
  page.on('console', msg => {
    if (msg.type() === 'error') consoleErrors.push(msg.text());
  });

  const response = await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 30000 });
  const title = await page.title();
  const screenshotPath = path.join(outDir, `browser-check-${Date.now()}.png`);
  await page.screenshot({ path: screenshotPath, fullPage: true });
  await browser.close();

  const report = [
    `# Browser Check`,
    ``,
    `- URL: ${url}`,
    `- HTTP status: ${response ? response.status() : 'unknown'}`,
    `- Title: ${title}`,
    `- Screenshot: ${screenshotPath}`,
    `- Console errors: ${consoleErrors.length}`,
    ``,
    ...consoleErrors.map(e => `  - ${e}`),
    ``
  ].join('\n');

  const reportPath = path.join(outDir, `browser-check-${Date.now()}.md`);
  await fs.writeFile(reportPath, report, 'utf8');
  console.log(report);
  console.log(`Report written: ${reportPath}`);

  if (consoleErrors.length > 0) process.exitCode = 1;
}

main().catch(error => {
  console.error(error);
  process.exit(1);
});
