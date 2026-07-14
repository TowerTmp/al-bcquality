---
bc-version: [14..]
domain: clean-code
keywords: [vertical-distance, locality, helper-placement, variable-declaration, readability]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Keep related code vertically close

## Description

Code that is used together should live together. A procedure and the helpers it calls belong near each other in the file, and a variable should be declared as close to its first use as AL's var-block rules allow. Large vertical gaps between related procedures force the reader to scroll back and forth and obscure the relationship between a caller and its helpers.

## Best Practice

Place a helper procedure immediately below the procedure that calls it, and group related procedures for the same entity (e.g. `ValidateOrder` and `PostOrder`) together rather than scattering them across the object. Declare narrowly-scoped variables in the procedure that uses them, not in a distant outer scope.

See sample: `keep-related-code-vertically-close.good.al`.

## Anti Pattern

A caller and the helper it depends on separated by a hundred lines of unrelated procedures. Detection signal: a helper defined far from its only caller, or related `ValidateX`/`PostX` procedures scattered across the file. Move them adjacent.

See sample: `keep-related-code-vertically-close.bad.al`.
