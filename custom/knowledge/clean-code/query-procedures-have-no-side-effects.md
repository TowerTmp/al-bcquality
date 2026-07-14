---
bc-version: [14..]
domain: clean-code
keywords: [side-effects, query-function, get, calc, purity, least-astonishment, modify, commit]
technologies: [al]
countries: [w1]
application-area: [all]
---

# A procedure that returns a value must not change state

## Description

A procedure that returns a value — especially one named `Get*`, `Calc*`, `Is*`, `Has*`, or `Find*` — should read data and nothing more. Writing to the database (`Modify`, `Insert`, `Delete`), calling `Commit`, or mutating global state inside such a procedure violates the principle of least astonishment: callers reasonably assume a query is read-only, so a hidden write corrupts data or transactions in ways that are hard to trace.

## Best Practice

Keep query procedures pure — read and return. If the name starts with `Get`/`Calc`/`Is`/`Has`/`Find`, it must not `Modify`/`Insert`/`Delete`/`Commit`. When a state change is genuinely needed, move it into a separate, clearly named command procedure the caller invokes deliberately.

See sample: `query-procedures-have-no-side-effects.good.al`.

## Anti Pattern

A `GetOutstandingAmount` that also stamps `Last Check Date` and calls `Modify` before returning. Detection signal: a `Modify`/`Insert`/`Delete`/`Commit` call inside a procedure that returns a value or whose name begins with `Get`/`Calc`/`Is`/`Has`/`Find`. Split the write out into a command.

See sample: `query-procedures-have-no-side-effects.bad.al`.
