# Safety

## Protected changes

Protected changes require extra review and often human approval:

- Authentication and authorization
- Billing and payments
- PII or sensitive data
- Database migrations
- Data deletion
- Secrets or environment config
- Production deployment config
- Tenant/account boundaries
- Security-sensitive integrations

## Required behaviors

Agents must:

- Ask before destructive actions.
- Record approvals in `.agent/decisions.md`.
- Keep changes scoped.
- Avoid unrelated refactors.
- Record test evidence honestly.
- Stop when blocked by missing permissions or unsafe ambiguity.

## Forbidden without explicit approval

- Force pushes
- Deleting data
- Rotating or exposing secrets
- Rewriting migrations
- Changing production config
- Removing tests to make checks pass
- Claiming unrun checks passed
