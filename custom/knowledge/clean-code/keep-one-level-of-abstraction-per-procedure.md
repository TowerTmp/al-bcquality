---
bc-version: [14..]
domain: clean-code
keywords: [abstraction-level, orchestration, helpers, readability, single-responsibility]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Keep one level of abstraction per procedure

## Description

Every statement in a procedure should sit at the same conceptual level. When a procedure mixes high-level orchestration (`ValidateCustomerCredit`, `PostDocument`) with low-level detail (`SetRange`, `FindSet`, direct field assignments), the reader must constantly switch between "what the feature does" and "how a record is manipulated." Splitting the levels makes the flow readable at a glance and pushes detail into focused helpers.

## Best Practice

Let high-level procedures read as a sequence of named steps, each delegating to a helper. Keep raw record navigation (`SetRange`/`FindSet`/field assignments) inside low-level procedures that each do one concrete thing.

See sample: `keep-one-level-of-abstraction-per-procedure.good.al`.

## Anti Pattern

A `ProcessSalesOrder` that inlines a `Customer.Get`/`CalcFields`/credit check and a `SalesLine.SetRange`/`FindSet` loop right next to a high-level `PostDocument` call. Detection signal: a procedure that interleaves orchestration calls with direct record/field operations. Extract the detail into helpers.

See sample: `keep-one-level-of-abstraction-per-procedure.bad.al`.
