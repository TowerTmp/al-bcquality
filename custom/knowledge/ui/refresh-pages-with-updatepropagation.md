---
bc-version: [14..]
domain: ui
keywords: [updatepropagation, currpage-update, subpage, parent-refresh, part-control, ui-refresh]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Refresh parent pages with `UpdatePropagation`, not redundant `CurrPage.Update` calls

## Description

When a value changed on a subpage (part) must be reflected in a total or summary on the parent page, the platform provides `UpdatePropagation = Both` on the part control: a single `CurrPage.Update()` in the subpage then refreshes both the subpage and the parent automatically. Developers often instead sprinkle manual refresh code - explicit refresh actions on the parent, `CurrPage.<Part>.Page.Update(...)` calls, or `CurrPage.Update(true)` where `true` is already the default when the page has a `SourceTable`. These calls are redundant because the platform already re-renders the page and its parts when a trigger exits. Worst of all is calling `CurrPage.Update()` from a business codeunit, which is not accessible there and couples business logic to the UI, breaking testability.

## Best Practice

Set `UpdatePropagation = Both` on the part control and let a single `CurrPage.Update()` in the subpage drive the parent refresh. Keep all UI-refresh concerns inside page objects; business codeunits must never reference `CurrPage`. Only write an explicit `CurrPage.Update(false)` when the page has no `SourceTable` and the platform will not auto-save.

See sample: `refresh-pages-with-updatepropagation.good.al`.

## Anti Pattern

Manual refresh plumbing where `UpdatePropagation` should handle it, or `CurrPage.Update()` inside a codeunit. Detection signal: `CurrPage.Update()` in a codeunit object; `CurrPage."<Part>".Page.Update(...)` or `.Page.SetTempRecord(...)` inside a routine data-change trigger; `CurrPage.Update(true)` on a page that has a `SourceTable`; or a parent-page action whose only job is to call `CurrPage.Update()` to refresh totals.

See sample: `refresh-pages-with-updatepropagation.bad.al`.
