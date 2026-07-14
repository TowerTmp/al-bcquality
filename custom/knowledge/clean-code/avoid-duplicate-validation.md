---
bc-version: [14..]
domain: clean-code
keywords: [validation, single-source-of-truth, onvalidate, defensive-checks, duplication, authoritative-layer]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Validate a rule once, at the authoritative layer

## Description

The same rule re-checked on the page, again in the table, and once more at posting is duplication: three copies of one truth that drift apart as requirements change, and three messages to keep worded alike. Data that entered through a validated path is already known to satisfy those checks, so repeating them at process time adds code without adding safety. Decide which layer owns each rule and enforce it there only.

## Best Practice

Put a data-integrity rule in the table's `OnValidate` trigger (or the insert routine), so it holds no matter which page or API writes the field, and let downstream code trust it. Only re-validate a condition that genuinely can change between entry and processing (for example a record state or a related balance that moves in the meantime).

See sample: `avoid-duplicate-validation.good.al`.

## Anti Pattern

A submit/post routine that re-checks `Quantity > 0`, non-blank codes, or blocked flags that the entry point already validated. Detection signal: a validation loop or procedure whose checks duplicate `OnValidate` triggers or the insert procedure on the same fields. Delete the redundant re-checks and keep the single authoritative validation.

See sample: `avoid-duplicate-validation.bad.al`.
