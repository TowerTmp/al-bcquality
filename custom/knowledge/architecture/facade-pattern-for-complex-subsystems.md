---
bc-version: [14..]
domain: architecture
keywords: [facade, subsystem, coupling, orchestration, codeunit, api-simplification]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Hide a complex subsystem behind a facade codeunit

## Description

When an operation spans many tables, codeunits, and steps, expose it through a single **facade** codeunit that offers one clean, business-focused method per operation and hides the coordination inside. Clients then depend on the facade, not on the internals, so subsystem changes don't ripple across the codebase, and orchestration/validation/error handling live in one place instead of being re-implemented at every call site.

## Best Practice

Give the facade public methods named for business operations (`PostAndShipOrder`, `CalculateRebate`) and keep the multi-step detail in private procedures. One facade covers one cohesive subsystem - resist turning it into a god-object that touches everything.

See sample: `facade-pattern-for-complex-subsystems.good.al`.

## Anti Pattern

Client code that reaches directly into several subsystem codeunits/tables and re-runs the coordination itself. Detection signal: the same multi-step sequence (get setup -> validate -> call A -> call B -> update) duplicated across multiple callers instead of sitting behind one facade method.

See sample: `facade-pattern-for-complex-subsystems.bad.al`.
