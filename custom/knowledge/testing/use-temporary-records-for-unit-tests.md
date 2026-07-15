---
bc-version: [14..]
domain: testing
keywords: [temporary-record, unit-test, isolation, integration-test, fixtures]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Use temporary records for unit tests; real records only for integration tests

## Description

A unit test declares its record variables as `temporary` so it runs entirely in memory: no database writes, no locking, no dependence on company data, and nothing to clean up. Real (non-temporary) records and W1 library creators belong only in integration tests that deliberately exercise persistence and posting.

## Best Practice

In unit tests, declare `Record X temporary` and build fixtures in memory. Reserve real records + `Library - *` creators for integration tests. Set `TestPermissions = Disabled` and rely on `temporary` for isolation.

See sample: `use-temporary-records-for-unit-tests.good.al`.

## Anti Pattern

A unit test that Inserts/posts a non-temporary record into the database. Detection signal: a `[Test]` in a unit-test codeunit whose record variable is not `temporary` and which calls `Insert`/`Modify`/`Post`.

See sample: `use-temporary-records-for-unit-tests.bad.al`.
