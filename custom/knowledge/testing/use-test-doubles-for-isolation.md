---
bc-version: [14..]
domain: testing
keywords: [test-double, stub, mock, spy, dependency-injection, interface, unit-test, integration-test, isolation]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Isolate the code under test with test doubles and dependency injection

## Description

A unit test should verify your own logic, not the database or an external service that logic happens to call. When code depends on a concrete implementation, the test is forced to exercise that dependency too, making it slow, flaky, and unable to reproduce failure paths on demand. Depend on an interface and inject the implementation, so a test can substitute a test double — a stub that returns canned values, a spy that records how it was called, or a throwing double that simulates a dependency failure. Reserve integration tests, which use the real implementations, for verifying that the pieces are wired together correctly.

## Best Practice

Define dependencies as interfaces and pass the implementation in (setter injection or a parameter) rather than instantiating a concrete codeunit inside the code under test. In tests, inject a double: a stub to control return values, a spy to assert the dependency was called with the right arguments, and a throwing double to drive error-handling branches. Keep many fast, isolated unit tests and a small number of integration tests that wire up the real implementations end to end.

See sample: `use-test-doubles-for-isolation.good.al`.

## Anti Pattern

The code under test `NewInstance`s a concrete service codeunit (or hits a table/HTTP endpoint) directly, so the test cannot run without that dependency and cannot force its failure paths. Detection signal: a `[Test]` method that spins up a real container, seeds live data, or calls out to an external service just to exercise a branch of business logic; or a codeunit under test that hard-references a concrete dependency instead of an interface. Extract an interface, inject it, and swap in a double.

See sample: `use-test-doubles-for-isolation.bad.al`.
