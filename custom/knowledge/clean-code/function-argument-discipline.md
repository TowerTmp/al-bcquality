---
bc-version: [14..]
domain: clean-code
keywords: [parameters, argument-count, flag-argument, boolean-parameter, single-responsibility, parameter-object]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Keep procedure parameter lists short and avoid boolean flag arguments

## Description

A procedure with more than three or four parameters is usually doing too much, and a boolean parameter that switches behaviour means the procedure really has two responsibilities hidden behind one name. Long parameter lists are hard to read at the call site and easy to mis-order; flag arguments hide a branch the caller cannot see from the signature. This is Clean Code guideline CC001, adapted for AL.

## Best Practice

Aim for three or fewer parameters. When a procedure needs many related values, pass the record (or a temporary buffer) instead of individual fields. When a boolean parameter selects between two behaviours, split it into two clearly named procedures so the call site reads unambiguously.

See sample: `function-argument-discipline.good.al`.

## Anti Pattern

A procedure such as `PostDocument(DocType; DocNo; Ship; Invoice; Preview; HideDialog)` — six parameters, three of them booleans that each change what the procedure does. Detection signal: a procedure declaration with more than four parameters, or any boolean parameter whose name reads like a mode switch (`Ship`, `Preview`, `HideDialog`). Refactor to a record/buffer parameter and/or separate procedures.

See sample: `function-argument-discipline.bad.al`.
