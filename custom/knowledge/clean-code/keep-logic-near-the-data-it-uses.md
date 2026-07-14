---
bc-version: [14..]
domain: clean-code
keywords: [feature-envy, coupling, cohesion, management-codeunit, single-responsibility]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Keep logic near the data it operates on

## Description

A procedure that reads and writes more fields of another record than of its own object exhibits "feature envy" — the logic really belongs in a codeunit that owns that data. Scattering one table's business rules across unrelated codeunits raises coupling, duplicates knowledge, and makes the rule hard to find and change. Move the behaviour to where the data lives and call it from the outside.

## Best Practice

Put logic in the codeunit that owns the data it manipulates. If a procedure in one codeunit is dominated by another record's fields, extract it into a management codeunit for that record and have the original caller delegate to it.

See sample: `keep-logic-near-the-data-it-uses.good.al`.

## Anti Pattern

A sales-processing codeunit that `Get`s a `Customer`, `CalcFields` its balance, compares to its credit limit, and `Modify`s it — all inline. Detection signal: a procedure whose body is mostly another record's field access and mutation. Relocate it to that record's management codeunit.

See sample: `keep-logic-near-the-data-it-uses.bad.al`.
