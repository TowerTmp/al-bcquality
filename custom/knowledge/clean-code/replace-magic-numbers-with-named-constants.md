---
bc-version: [14..]
domain: clean-code
keywords: [magic-numbers, named-constants, label, thresholds, business-rules, readability]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Replace magic numbers and inline strings in business logic with named constants

## Description

A literal number or string embedded in business logic hides its meaning: `if OutstandingAmount > 100000` says nothing about *why* 100000 matters, and `Amount * 0.15` could be a discount, a VAT rate, or a fee. Named constants (a `const`, a `Label`, or an enum value) make the business rule explicit and give a single place to change it. The values `0`, `1`, `-1`, `''`, `true`, and `false` are acceptable as-is.

## Best Practice

Give every business-meaningful literal a name: a threshold becomes a named variable/const, an option/status string becomes an enum, and user-facing message text becomes a `Label` (which also makes it translatable). Reference the name in the logic so intent is readable at a glance.

See sample: `replace-magic-numbers-with-named-constants.good.al`.

## Anti Pattern

`if OutstandingAmount > 100000 then Error('Customer %1 exceeds credit limit of %2.', No, 100000);` and `exit(Amount * 0.15);`. Detection signal: a numeric literal other than 0/1/-1 in a conditional or calculation, a status/option compared against an inline string literal, or `Error(...)` with an inline text literal instead of a `Label`. Extract each to a named constant.

See sample: `replace-magic-numbers-with-named-constants.bad.al`.
