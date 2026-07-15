---
bc-version: [14..]
domain: tooling
keywords: [object-id, object-id-ninja, mcp, id-collision, idranges, reservation]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Assign object IDs with Object ID Ninja, not by hand

## Description

Hand-picking object IDs causes collisions and merge conflicts as soon as more than one person works the codebase. Use the **AL Object ID Ninja** MCP to assign and reserve IDs from the app's configured ranges. Reserve one ID at a time, immediately before creating each object, so each reservation is committed before the next.

## Best Practice

Call `ninja_assignObjectId` (with `objectType` and a `targetFilePath` in the project) per object at creation time; use the returned number. Release an abandoned ID with `ninja_unassignObjectId`. Configure `idRanges` in `app.json` (customer range 50000-99999, or your assigned AppSource publisher range) so Ninja stays in-range. Do not pre-allocate a block of IDs or hardcode them.

## Anti Pattern

Guessing or hardcoding IDs, pre-allocating a block, or tracking assignments in a spreadsheet. Detection signal: new objects given manually chosen IDs with no reservation, or duplicate IDs surfacing during review or merge.
