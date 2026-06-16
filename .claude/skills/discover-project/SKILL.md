# Discover Project

Use this skill before building anything in a newly installed app repo.

## Goal

Infer the project-specific commands and update `CLAUDE.md` so future agents know how to install, run, test, lint, typecheck, and build the app.

## Instructions

Before implementation, inspect the repository and infer the project commands.

Look at:
- `package.json`
- lockfiles such as `package-lock.json`, `pnpm-lock.yaml`, `yarn.lock`, `bun.lockb`
- `README.md`
- `Makefile`
- Docker files
- `.github/workflows/*`
- framework config files such as `next.config.*`, `vite.config.*`, `turbo.json`, `tsconfig.json`
- backend config files such as `pyproject.toml`, `requirements.txt`, `Gemfile`, `go.mod`, or similar

Find:
- Install command
- Run/dev command
- Test command
- Typecheck command
- Lint command
- Build command

## Rules

- Prefer commands already used in package scripts, Makefile targets, or CI workflows.
- Determine the package manager from lockfiles.
- Do not invent commands.
- If a command does not exist, write `Not found`.
- If multiple valid commands exist, choose the safest default and document alternatives.
- Do not modify application code.
- Only update project setup documentation and command references.

## Output

Update the `Project-specific commands` section in `CLAUDE.md`.

Then provide a short summary:
- Files inspected
- Commands discovered
- Commands not found
- Recommended missing scripts to add, if any
