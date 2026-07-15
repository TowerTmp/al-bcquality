---
bc-version: [14..]
domain: testing
keywords: [failure-triage, red-test, regression, do-not-weaken-assertions]
technologies: [al]
countries: [w1]
application-area: [all]
---

# When a test fails, decide whether the test or the code is wrong - then fix that one

## Description

A red test means the test and the code disagree. Before changing anything, decide which is correct by comparing the assertion against the requirement. Blindly editing the test to go green hides a real regression; blindly editing the code hides a stale test. Weakening an assertion "to make it pass" is the most common way real bugs ship.

## Best Practice

On failure, read the requirement. If the code violates it, fix the code. If the requirement changed and the test is stale, update the test to the new expected value. Never loosen or delete an assertion purely to turn a test green.

See sample: `diagnose-whether-test-or-code-is-at-fault.good.al`.

## Anti Pattern

Relaxing, widening, or removing an assertion with no corresponding requirement change, just to pass. Detection signal: a test edit that loosens `AreEqual` to `IsTrue`/removes `ExpectedError`/widens the expected value, unaccompanied by a spec change.

See sample: `diagnose-whether-test-or-code-is-at-fault.bad.al`.
