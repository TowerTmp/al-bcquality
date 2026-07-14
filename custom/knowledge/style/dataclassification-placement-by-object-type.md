---
bc-version: [14..]
domain: style
keywords: [dataclassification, table, tableextension, field, property-placement, object-level]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Place DataClassification by object type: object level on tables, field level on table extensions

## Description

Where `DataClassification` belongs depends on the object type, not on which value you choose. On a `table` object it can be declared once at the object body level, where it applies as the default for every field. On a `tableextension` object it is not valid at the object level; it must be set inside each added field. This entry is about placement mechanics only, not about picking a particular classification value.

## Best Practice

On a `table`, set `DataClassification` once at the object body level (outside the `fields` block) and let the fields inherit it, overriding on individual fields only when one genuinely differs. On a `tableextension`, set `DataClassification` inside every added `field(...)` block, because the object level offers no place to declare it.

See sample: `dataclassification-placement-by-object-type.good.al`.

## Anti Pattern

A `tableextension` with `DataClassification` written at the object body level, or added fields that omit it and rely on inheritance that extensions do not provide. Detection signal: `DataClassification` appearing at the body of a `tableextension`, or an added field on a `tableextension` with no `DataClassification` property. On a `table`, the mirror anti-pattern is repeating the same `DataClassification` on every field instead of once at the object level.

See sample: `dataclassification-placement-by-object-type.bad.al`.
