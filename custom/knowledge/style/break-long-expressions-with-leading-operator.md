---
bc-version: [14..]
domain: style
keywords: [line-break, continuation, operator, boolean-expression, arithmetic, wrapping, readability]
technologies: [al]
countries: [w1]
application-area: [all]
---

# When wrapping a long expression, start each continuation line with the operator

## Description

Long boolean or arithmetic expressions read best when the operator that joins each term begins its line. A leading `and`, `or`, `+`, or `-` makes the structure of the expression scannable down the left edge, so a reader sees at a glance how the terms combine. Trailing operators hide at the ragged right edge, where they are easy to miss and make it harder to tell whether a term is complete.

## Best Practice

Break the expression so each continuation line starts with the binary operator, with the operands aligned beneath the first term. This keeps the joining logic in a single vertical column.

See sample: `break-long-expressions-with-leading-operator.good.al`.

## Anti Pattern

A wrapped expression whose lines end with `and`, `or`, `+`, or `-`. Detection signal: a continuation line terminating in a binary operator, forcing the reader to the end of each line to learn how it connects to the next. Move the operator to the start of the following line.

See sample: `break-long-expressions-with-leading-operator.bad.al`.
