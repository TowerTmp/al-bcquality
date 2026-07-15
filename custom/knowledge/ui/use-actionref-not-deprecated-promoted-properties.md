---
bc-version: [21..]
domain: ui
keywords: [actionref, promoted, area-promoted, al0533, al0534, deprecated, action-bar]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Promote actions with actionref in area(Promoted), not the deprecated Promoted properties

## Description

On runtime >= 8.0 (BC21+) the old action promotion properties - `Promoted`, `PromotedCategory`, `PromotedIsBig`, `PromotedOnly`, `PromotedActionCategories` - are deprecated (AL0533/AL0534). Actions are now promoted declaratively: define the action once in its functional area, then reference it from an `area(Promoted)` using `actionref` inside `group(Category_...)` blocks. This separates *what* an action does from *where* it appears on the ribbon.

## Best Practice

Declare each action in its functional area; add an `area(Promoted)` with `group(Category_X)` blocks (Caption set on the group) and one `actionref(Name_Promoted; Name)` per promoted action. Remove every deprecated `Promoted*` property.

See sample: `use-actionref-not-deprecated-promoted-properties.good.al`.

## Anti Pattern

`Promoted = true` / `PromotedCategory = ...` on actions when targeting runtime >= 8.0. Detection signal: any `Promoted`, `PromotedCategory`, `PromotedIsBig`, `PromotedOnly`, or `PromotedActionCategories` property in a `page`/`pageextension` whose `runtime` is >= 8.0. (On runtime < 8.0 these properties are still valid - do not flag.)

See sample: `use-actionref-not-deprecated-promoted-properties.bad.al`.
