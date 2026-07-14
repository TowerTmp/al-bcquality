---
bc-version: [14..]
domain: clean-code
keywords: [law-of-demeter, coupling, record-traversal, chaining, helper-procedure]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Avoid reaching through chains of records (Law of Demeter)

## Description

A procedure should talk to its direct collaborators, not reach across a chain of records to fetch distant data. Walking `Sales Line` to `Sales Header` to `Customer` to read a posting group couples the procedure to every table in the path, so a change to any intermediate relationship breaks it. Each hop also makes the code harder to read and to test.

## Best Practice

When a procedure needs data from a distant record, get it through a small helper that owns that hop, or pass the needed value in as a parameter. Keep each procedure to a single, shallow traversal so its dependencies are obvious.

See sample: `avoid-deep-record-traversal-chains.good.al`.

## Anti Pattern

`ProcessSalesLine` doing `SalesHeader.Get(...)` then `Customer.Get(SalesHeader."Sell-to Customer No.")` then reading `Customer."Customer Posting Group"` — a three-record chain to reach one field. Detection signal: two or more chained record `Get`/traversals inside one procedure to reach a value it then uses. Extract a helper or pass the value in.

See sample: `avoid-deep-record-traversal-chains.bad.al`.
