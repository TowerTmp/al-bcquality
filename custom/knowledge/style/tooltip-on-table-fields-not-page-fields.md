---
bc-version: [14..]
domain: style
keywords: [tooltip, table-field, page-field, aa0218, org-override, help-text]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Put ToolTips on table/tableextension fields, not on page controls (org override)

## Description

This is a deliberate **org override** of the Microsoft default `tooltip-required-on-page-fields`. The convention places the `ToolTip` on the table or tableextension field definition rather than on the page field control. The field's help text then lives once, with the field, and is inherited by every page that shows it - instead of being copied onto each page control where the wording inevitably drifts. AppSourceCop **AA0218** ("ToolTip missing on page field") is therefore expected under this convention and is intentionally left unsatisfied; it must not be silenced by adding page-level ToolTips.

## Best Practice

Declare `ToolTip` on each `table`/`tableextension` field. Do not add `ToolTip` to page field controls. Treat AA0218 as expected policy noise rather than a finding to fix on the page.

See sample: `tooltip-on-table-fields-not-page-fields.good.al`.

## Anti Pattern

`ToolTip` on a page field control (duplicated per page, drifts over time), or a page ToolTip added only to silence AA0218. Detection signal: `ToolTip = ` inside a `field(...)` control within a `page` or `pageextension` body.

See sample: `tooltip-on-table-fields-not-page-fields.bad.al`.
