---
bc-version: [14..]
domain: clean-code
keywords: [defensive-returns, not-found, get, tryget, error-handling, lookup]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Handle the not-found case explicitly in lookups

## Description

A procedure that looks up a record or computes a value from one must decide, out loud, what happens when the record is missing. Silently returning `0` or `''` on a failed `Get` hides the failure: the caller cannot tell an absent record from a legitimate zero, and the bug surfaces far from its cause. Make the outcome explicit — either error on not-found, or return a boolean that forces the caller to handle it.

## Best Practice

For a required record, guard the `Get` and `Error` with a clear message when it fails. For an optional lookup, use a `TryGet`-style procedure that returns `Boolean` and yields the value through a `var` parameter, so the caller must check success before using the result.

See sample: `handle-not-found-explicitly-in-lookups.good.al`.

## Anti Pattern

`GetCustomerCreditLimit` that returns `Customer."Credit Limit"` only inside `if Customer.Get(...)` and otherwise falls through returning `0`. Detection signal: a value-returning procedure whose record `Get`/`FindFirst` can fail with no `Error` and no boolean result — a silent default. Make not-found explicit.

See sample: `handle-not-found-explicitly-in-lookups.bad.al`.
