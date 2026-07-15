---
bc-version: [14..]
domain: testing
keywords: [requirements, traceability, coverage, regression]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Trace every requirement to at least one test

## Description

Every functional requirement needs at least one test that would fail if the requirement regressed. Line/branch coverage can be high while a whole requirement stays unverified - the code runs during other tests but no assertion pins its business outcome.

## Best Practice

Map each FR/NFR to one or more named tests and keep the mapping explicit (a test-plan table or descriptive test names). When you add a requirement, add its test; when a requirement changes, update its test.

See sample: `trace-every-requirement-to-a-test.good.al`.

## Anti Pattern

A requirement with no test whose name or assertions trace to it, or tests that assert incidental details but never the requirement's outcome. Detection signal: a spec requirement that no test references.

See sample: `trace-every-requirement-to-a-test.bad.al`.
