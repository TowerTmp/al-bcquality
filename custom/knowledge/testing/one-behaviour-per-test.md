---
bc-version: [14..]
domain: testing
keywords: [single-responsibility, one-assertion, test-naming, focus]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Verify one behaviour per test

## Description

A `[Test]` method should verify a single behaviour, named for that behaviour. When one method checks several unrelated outcomes, the first failing assertion masks the rest and the method name cannot describe what broke - so a red run tells you little.

## Best Practice

One logical behaviour per test; name the method after it (e.g. `PostingBlockedWhenOverCreditLimit`). Multiple assertions are fine only when they describe facets of the same outcome.

See sample: `one-behaviour-per-test.good.al`.

## Anti Pattern

A catch-all method that sets up several scenarios and asserts each. Detection signal: a generic test name (`TestDiscount`, `Scenario1`) whose body exercises multiple independent scenarios or actions.

See sample: `one-behaviour-per-test.bad.al`.
