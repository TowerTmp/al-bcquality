---
bc-version: [14..]
domain: security
keywords: [writepermission, tabledata-permission, delete, modify, post, least-privilege, permission-check]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Check write permission before a write or post path

## Description

Relying on the platform to reject an unauthorized write only after the operation runs produces a late, confusing failure — often after side effects, dialogs, or partial posting have already occurred. For sensitive paths such as deleting records, posting documents, or modifying master data, the code should confirm the user is entitled to write before doing any work. `Rec.WritePermission` (and the `TableData` permission properties) expose that entitlement cheaply and let the extension fail fast with a clear message.

## Best Practice

At the start of a sensitive operation, test the relevant permission — `Rec.WritePermission` for a table write, or the appropriate `TableData ... = D/M` grant for the path — and raise a labelled `Error` when it is missing, before any record is touched. This gives the user an actionable message up front and keeps the operation aligned with least-privilege permission sets.

See sample: `check-writepermission-before-writing.good.al`.

## Anti Pattern

A procedure that calls `Delete`, `Modify`, or a posting routine directly with no permission test in front of it, leaving enforcement to whatever error the platform eventually throws. Detection signal: a `Delete(true)` / `Modify(true)` / post call in a sensitive procedure with no preceding `WritePermission` (or equivalent permission) check. Add the guard before the write.

See sample: `check-writepermission-before-writing.bad.al`.
