---
bc-version: [14..]
domain: testing
keywords: [independence, order-agnostic, isolation, shared-state, flaky]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Keep tests independent and order-agnostic

## Description

A test must pass regardless of the order it runs in and must not depend on state left behind by another test. Order-dependent tests fail intermittently, pass in isolation but fail in the suite, and are very hard to diagnose.

## Best Practice

Each test arranges its own fixtures and asserts only what it set up. Never read data another test created; never assert a global count that shifts as tests are added. Use `temporary` records and test isolation so no state leaks between tests.

See sample: `keep-tests-independent.good.al`.

## Anti Pattern

A test that relies on a record created by an earlier test, or asserts a database-wide total. Detection signal: a test that passes alone but fails when the suite is reordered, or reads data it did not arrange.

See sample: `keep-tests-independent.bad.al`.
