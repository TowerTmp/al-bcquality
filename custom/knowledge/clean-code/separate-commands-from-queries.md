---
bc-version: [14..]
domain: clean-code
keywords: [command-query-separation, cqs, return-value, state-change, tryfunction]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Separate commands from queries

## Description

A procedure should either change state (a command, returning nothing) or return a value (a query, changing nothing) — not both. When one procedure does both, callers cannot tell from the call site whether invoking it writes to the database, which makes the code hard to reason about and unsafe to call speculatively. The recognised exceptions are the `[TryFunction]` pattern (returns a success boolean) and fluent/builder chains that return the builder.

## Best Practice

Make commands return nothing and change state; make queries return a value and leave observable state unchanged. When you need a success/failure boolean around an operation, use a `[TryFunction]` rather than blending a write with a return value.

See sample: `separate-commands-from-queries.good.al`.

## Anti Pattern

A `ValidateAndGetAmount(var SalesLine): Decimal` that validates, `Modify`s the line, and returns its `Line Amount`. Detection signal: a procedure that both calls `Modify`/`Insert`/`Delete` and returns a value, and is not a `[TryFunction]`. Split it into a command and a query.

See sample: `separate-commands-from-queries.bad.al`.
