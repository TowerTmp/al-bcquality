---
bc-version: [14..]
domain: testing
keywords: [happy-path, negative-test, edge-case, boundary, branch-coverage]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Cover the happy path, the negative path, and the edges

## Description

For each behaviour, test the happy path, the negative/error path, and the boundaries. Happy-path-only suites miss the failures users actually hit. Edges include empty input, zero and negative numbers, boundary values (min/max, off-by-one), maximum lengths, and first/last option/enum values. Both branches of every `if` deserve a test.

## Best Practice

For every requirement write at least: one happy-path test, one negative test (invalid input errors as designed), and boundary tests for numeric/text/date ranges. Walk each guard/`if` and cover both outcomes.

See sample: `cover-happy-negative-and-edge-cases.good.al`.

## Anti Pattern

Only happy-path tests; no test that the code rejects invalid input or handles the boundary. Detection signal: a procedure with an error/guard branch that has no test exercising that branch.

See sample: `cover-happy-negative-and-edge-cases.bad.al`.
