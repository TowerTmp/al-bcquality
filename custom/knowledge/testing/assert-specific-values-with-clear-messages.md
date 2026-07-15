---
bc-version: [14..]
domain: testing
keywords: [assertions, expected-value, message, asserterror, diagnosability]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Assert specific values with clear messages

## Description

An assertion should check the exact expected value and carry a message explaining what was expected, so a failure is self-describing. Asserting only "not zero" or "no error thrown" lets regressions through and produces failures no one can read. For expected errors, assert the specific error - not that any error occurred.

## Best Practice

Use `Assert.AreEqual(Expected, Actual, 'why')` with the concrete value and a message naming the field/scenario. For expected failures use `asserterror` followed by `Assert.ExpectedError('specific text')`.

See sample: `assert-specific-values-with-clear-messages.good.al`.

## Anti Pattern

`Assert.IsTrue(x <> 0)`, assertions with no message, or `asserterror` that does not check the error text (so any error passes). Detection signal: assertions without an expected value or message, or an `asserterror` with no following `ExpectedError`.

See sample: `assert-specific-values-with-clear-messages.bad.al`.
