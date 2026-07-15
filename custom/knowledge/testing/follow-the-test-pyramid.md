---
bc-version: [14..]
domain: testing
keywords: [test-pyramid, unit-test, integration-test, temporary-record, speed]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Favour many unit tests over few integration tests (test pyramid)

## Description

AL unit tests run against `temporary` records and injected mocks - no posting, no real tables - so they are fast, deterministic, and pinpoint the failing logic. Integration tests exercise real posting routines and W1 libraries; they are slow and brittle. A suite that is mostly integration tests takes minutes to run, fails for unrelated reasons, and makes diagnosis hard.

## Best Practice

Push behaviour coverage down to unit tests (temporary records, interface mocks) and keep a thin top of integration tests for genuine end-to-end flows that need real posting or data. A healthy suite has a broad base of unit tests.

See sample: `follow-the-test-pyramid.good.al`.

## Anti Pattern

Verifying pure logic (a calculation, a validation) by posting a full document. Detection signal: integration tests outnumber unit tests, or unit-testable logic is only reachable through posting routines.

See sample: `follow-the-test-pyramid.bad.al`.
