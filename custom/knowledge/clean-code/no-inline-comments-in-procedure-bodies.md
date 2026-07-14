---
bc-version: [14..]
domain: clean-code
keywords: [comments, self-documenting-code, extract-method, commented-out-code, xml-doc]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Prefer self-explanatory code over comments inside procedure bodies

## Description

A comment that explains *what* a block of code does is usually a signal to extract that block into a well-named helper procedure instead. Clear names and small, focused procedures document intent better than inline comments, which drift out of date and add noise. Keep XML doc comments (`///`) above procedures to describe public API and rationale, and delete commented-out code — version control preserves history. (This is an organisational style preference; it is stricter than the AL analyzers, which do not flag inline comments.)

## Best Practice

Make the code read for itself through naming and decomposition. Put *why* (not *what*) in a `///` doc comment above the procedure, or express it by extracting a well-named helper. Remove noise comments and any commented-out code.

See sample: `no-inline-comments-in-procedure-bodies.good.al`.

## Anti Pattern

Bodies peppered with narration ("// get the customer", "// loop through records") and blocks of old logic commented out "for reference." Detection signal: `//` comments between `begin..end` that restate the code, or commented-out AL statements. Extract or delete them.

See sample: `no-inline-comments-in-procedure-bodies.bad.al`.
