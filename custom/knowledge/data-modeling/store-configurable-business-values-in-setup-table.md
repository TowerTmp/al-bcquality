---
bc-version: [14..]
domain: data-modeling
keywords: [setup-table, configuration, hardcoded, business-rules, thresholds, magic-number]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Store configurable business values in a setup table, not in code

## Description

Business configuration - discount rates, tax rates, credit thresholds, fees, approval limits, account mappings - belongs in a setup table, never hardcoded in AL. A hardcoded business value cannot be changed without a redeploy and cannot differ per company or tenant, so business rules become developer tasks. This is separate from the singleton *mechanics* of a setup table (see `setup-table-is-a-singleton`): it is about **which** values belong there. Technical constants (buffer sizes, retry counts, timeouts) and enum structure stay in code.

## Best Practice

When a value drives business behaviour (a rate, cap, threshold, fee, template, or mapping), store it as a field on a setup table with validation and an admin Card page, and read it at runtime. Keep genuinely technical constants and fixed platform limits in code.

See sample: `store-configurable-business-values-in-setup-table.good.al`.

## Anti Pattern

Hardcoded business numbers, or a `case`/if-chain that returns different business values per type. Detection signal: numeric business literals (e.g. a discount `5`, a rate `0.15`, a threshold) in logic, or business values returned directly from `case` branches, instead of read from a setup record.

See sample: `store-configurable-business-values-in-setup-table.bad.al`.
