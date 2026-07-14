---
bc-version: [14..]
domain: testing
keywords: [branch-coverage, code-coverage, negative-test, edge-case, happy-path, if-else, case, validation]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Cover both branches of every condition

## Description

A test suite that only exercises the happy path leaves the guards, early exits, and error paths unproven — exactly the code that protects data integrity. For every `if` and every `case` arm in the code under test, at least one test must drive the condition true and at least one must drive it false; a validation rule needs a test that trips it and a test that passes it. This maps directly to what Business Central's code coverage report measures, and it forces the negative and edge cases (blank, zero, boundary, maximum) into the open. The false branch counts even when it merely skips a block or exits silently.

## Best Practice

Read each procedure, list every `if`/`case`, and write a test for each outcome: the true path and the false path. Combine that with explicit edge-case tests around boundaries — zero, blank, maximum, exactly-at-limit. For a rule that raises an error, pair a negative test (`asserterror` + `ExpectedError`) that triggers the rule with a positive test that satisfies it, so both the guarded and the allowed behaviour are certified.

See sample: `cover-both-branches-of-every-condition.good.al`.

## Anti Pattern

Only the success case is tested: `PostOrder` is verified with a valid order, but no test drives the credit-limit check over the limit, so the guard could be deleted and the suite would still pass. Detection signal: a procedure containing an `if`/`case` (especially one guarding an `Error`, an `exit`, or a skipped block) that has a happy-path test but no test for the other branch — visible as red lines in the code coverage report. Add the missing branch and edge tests.

See sample: `cover-both-branches-of-every-condition.bad.al`.
