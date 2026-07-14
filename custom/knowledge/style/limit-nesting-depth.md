---
bc-version: [14..]
domain: style
keywords: [nesting, depth, guard-clause, early-exit, extract-method, complexity, readability]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Keep nesting to three levels; flatten with guard clauses and helpers

## Description

Deeply nested `if`/`for`/`while`/`case` blocks push logic far to the right and force the reader to hold every enclosing condition in mind at once. Beyond about three levels the code becomes hard to follow and the true intent is buried under indentation. Excessive depth is a signal that a block wants to become its own procedure or that a condition should be handled and dismissed up front.

## Best Practice

Keep nested compound statements to three levels or fewer. Turn leading conditions into guard clauses that `exit` early, and extract an inner block into a well-named helper procedure so each level does one thing.

See sample: `limit-nesting-depth.good.al`.

## Anti Pattern

Four or more levels of `if`/`for`/`while`/`case` nested inside one procedure. Detection signal: a compound statement whose body sits at the fourth indentation level of control flow or deeper. Flatten it with a guard clause or by extracting the inner levels into a separate procedure.

See sample: `limit-nesting-depth.bad.al`.
