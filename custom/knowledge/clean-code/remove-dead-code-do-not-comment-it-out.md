---
bc-version: [14..]
domain: clean-code
keywords: [dead-code, commented-out-code, empty-trigger, unreachable-code, uncalled-procedure, cleanup]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Delete dead code instead of commenting it out, and remove empty triggers

## Description

Dead code — commented-out blocks, empty triggers, unreachable statements after an unconditional `Error`/`exit`, and public procedures that are never called and carry no event attribute — adds noise and misleads the next reader. Version control already preserves history, so the source file should contain only live code. This is Clean Code guideline CC010 (Ekko CC009), scoped to what the compiler does *not* flag: the AL analyzers already catch unused variables (AA0137) and unused local methods (AA0228), so this rule targets the residue they miss.

## Best Practice

Delete disabled code rather than commenting it out. Add a trigger (`OnInsert`, `OnModify`, …) only when it does something — never leave an empty `begin..end` "for later". Remove statements that can never run and public procedures with no caller and no subscriber attribute.

See sample: `remove-dead-code-do-not-comment-it-out.good.al`.

## Anti Pattern

Empty `OnModify`/`OnDelete` triggers with only a `// TODO` inside, and blocks of `// PostOrder();` commented out "for testing". Detection signal: a trigger body with no executable statement, a `//`-commented line that is itself AL code, or code following an unconditional `Error(...)`/`exit`. Delete them.

See sample: `remove-dead-code-do-not-comment-it-out.bad.al`.
