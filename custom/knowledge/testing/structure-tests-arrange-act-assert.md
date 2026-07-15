---
bc-version: [14..]
domain: testing
keywords: [arrange-act-assert, given-when-then, structure, readability]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Structure every test as GIVEN / WHEN / THEN

## Description

A test reads clearly when its three phases are separated: GIVEN arranges fixtures and state, WHEN performs the single action under test, THEN asserts the outcome. Interleaving setup, actions, and assertions hides what the test actually verifies and makes failures hard to place.

## Best Practice

Separate the three phases (a blank line or a `// GIVEN/WHEN/THEN` marker), perform exactly one WHEN, and keep all assertions in THEN. The action under test should be a single call.

See sample: `structure-tests-arrange-act-assert.good.al`.

## Anti Pattern

Setup, calls, and asserts interleaved throughout the body, or several distinct actions each followed by their own asserts. Detection signal: assertions appear before the primary action, or the body performs more than one independent action.

See sample: `structure-tests-arrange-act-assert.bad.al`.
