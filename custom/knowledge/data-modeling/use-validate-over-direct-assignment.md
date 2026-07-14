---
bc-version: [14..]
domain: data-modeling
keywords: [validate, field-assignment, onvalidate, data-integrity, cascading-logic, direct-assignment]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Assign fields through `Validate` when the field has validation side effects

## Description

Business Central fields frequently carry `OnValidate` logic that recalculates dependent fields, applies defaults, and enforces business rules. A bare assignment (`Rec.Field := X`) writes the value straight into the record buffer and silently skips that `OnValidate` trigger, so the dependent fields are never recalculated. The record is left internally inconsistent - amounts, VAT, posting groups, and descriptions that `OnValidate` would have filled stay blank or stale. Use `Rec.Validate(Field, X)` (or `Rec.Validate(Field)` after setting the value) so the field's validation logic runs.

## Best Practice

Set any field that has meaningful `OnValidate` logic through `Validate` so cascading calculations fire. On BC standard document and journal lines, validate every business field (item, quantity, unit price, posting date, dimensions) in dependency order. Pure identifier fields with no `OnValidate` side effects (template/batch names, line numbers, document numbers) may be assigned directly.

See sample: `use-validate-over-direct-assignment.good.al`.

## Anti Pattern

Populating a record with bare `:=` on fields that own validation logic, then calling `Insert`/`Modify`. The value lands but `OnValidate` never runs, so dependent fields are wrong and the record cannot post correctly. Detection signal: a direct assignment `Rec.<BusinessField> := <value>;` to a field known to have `OnValidate` logic (for example `"No."`, `Quantity`, `"Unit Price"`, `"Line Discount %"` on a Sales/Purchase/Journal line), especially when followed by `Insert(true)` or `Modify(true)`.

See sample: `use-validate-over-direct-assignment.bad.al`.
