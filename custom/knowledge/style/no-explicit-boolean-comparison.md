---
bc-version: [14..]
domain: style
keywords: [boolean, comparison, true, false, condition, if, readability]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Use a boolean expression directly instead of comparing it to true or false

## Description

A boolean expression already evaluates to `true` or `false`, so comparing it to a boolean literal is redundant. `if IsBlocked = true then` says nothing more than `if IsBlocked then`, and `if IsBlocked = false then` is just a longer way to write `if not IsBlocked then`. The literal comparison adds reading overhead and invites the classic `=` versus `:=` slip.

## Best Practice

Write the condition as the boolean itself: `if IsX then` for the positive case and `if not IsX then` for the negative case. Combine boolean expressions directly when assigning, without trailing `= true`.

See sample: `no-explicit-boolean-comparison.good.al`.

## Anti Pattern

A boolean value compared against `true` or `false`, such as `if IsValid = true then` or `if IsBlocked = false then`. Detection signal: the tokens `= true`, `= false`, `<> true`, or `<> false` anywhere a boolean is already in hand. Drop the comparison; negate with `not` when the literal was `false`.

See sample: `no-explicit-boolean-comparison.bad.al`.
