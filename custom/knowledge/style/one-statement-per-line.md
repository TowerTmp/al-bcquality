---
bc-version: [14..]
domain: style
keywords: [statement, one-per-line, semicolon, formatting, readability, debugging]
technologies: [al]
countries: [w1]
application-area: [all]
---

# One statement per line

## Description

Each AL statement belongs on its own line. Packing several `;`-separated statements onto one physical line hides control flow, defeats line-by-line debugging and breakpoints, and makes diffs report a single churny line instead of the specific statement that changed. One statement per line keeps each action independently visible, reviewable, and revertible.

## Best Practice

Write exactly one statement per line. Let assignments, calls, and control-flow keywords each occupy their own line; the AL formatter keeps them aligned.

See sample: `one-statement-per-line.good.al`.

## Anti Pattern

Two or more statements separated by `;` on the same physical line. Detection signal: a line containing more than one statement terminator `;` outside a `var` section or a procedure signature. Split each statement onto its own line.

See sample: `one-statement-per-line.bad.al`.
