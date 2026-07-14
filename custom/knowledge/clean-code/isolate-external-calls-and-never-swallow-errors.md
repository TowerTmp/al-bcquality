---
bc-version: [14..]
domain: clean-code
keywords: [tryfunction, error-isolation, external-call, httpclient, empty-catch, getlasterrortext]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Isolate fallible external calls and never swallow the error

## Description

Predictable failures — outbound HTTP, optional operations that may not complete — should be wrapped in a `[TryFunction]` or `Codeunit.Run` so a failure is caught instead of aborting the whole transaction. Just as important, a caught failure must never be swallowed: an empty `if not Try...() then begin end` block hides the fault and lets the code proceed on empty or invalid data, which is worse than failing loudly.

## Best Practice

Wrap external/fallible work in a `[TryFunction]`, and on failure surface it — log or show `GetLastErrorText()` and stop, or take a deliberate fallback. Reserve `Error()` for business-rule violations. Never leave an empty failure branch.

See sample: `isolate-external-calls-and-never-swallow-errors.good.al`.

## Anti Pattern

`if not TryCallExternalApi(Response) then begin end;` followed by code that uses `Response` anyway, or a bare `exit;` on failure that leaves the user with no idea why nothing happened. Detection signal: an empty branch after a failed `TryFunction`/`Codeunit.Run`, or an unwrapped `HttpClient` call in a path that must stay transactional.

See sample: `isolate-external-calls-and-never-swallow-errors.bad.al`.
