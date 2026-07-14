---
bc-version: [14..]
domain: security
keywords: [filter-injection, setfilter, setrange, strsubstno, user-input, sanitization, delchr]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Guard record filters against injection from user input

## Description

`SetFilter` interprets its argument as a filter expression, so `|`, `..`, `<`, `>`, `&`, `*`, and `@` are operators, not literal characters. When user-supplied text is passed straight into `SetFilter` — or spliced into a filter with `StrSubstNo` — a caller can inject operators that widen the result set far beyond what was intended. For example, a value of `'..|..'` in a customer filter matches every record instead of one, leaking data the user was never scoped to see.

## Best Practice

Prefer `SetRange` with a typed parameter: it treats the value as a literal, so no operator can be injected. When a genuine filter expression is required, validate the input against an allow-list of accepted values before applying it, or sanitize it with `DELCHR` to strip filter operator characters. Keep the raw user string out of `SetFilter`/`StrSubstNo` unless it has passed one of those gates.

See sample: `guard-filters-against-injection.good.al`.

## Anti Pattern

Passing an unsanitized `Text` parameter directly into `SetFilter`, or building the filter with `StrSubstNo('%1..%2', FromValue, ToValue)` from user input. Detection signal: a `SetFilter` (or `SetView`) call whose value argument is a `Text` parameter, a page/request field, or a `StrSubstNo` result that includes such input — with no preceding allow-list check or `DELCHR` sanitization. Convert it to `SetRange`, or add the validation step.

See sample: `guard-filters-against-injection.bad.al`.
