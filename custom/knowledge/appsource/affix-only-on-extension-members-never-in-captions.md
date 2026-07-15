---
bc-version: [all]
domain: appsource
keywords: [affix, prefix, tableextension, enumextension, caption, as0011, over-affixing]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Affix extension members only - never own-object members, never captions

## Description

Refines the base affix rule (see `object-affixes-prevent-collisions`), which requires the affix on object names and on members added to base objects. Two clarifications catch the common mistakes in the *other* direction: (1) affix field names and enum values **only when extending a base object** (a `tableextension` field, an `enumextension` value) - do **not** affix fields on tables you own or values in enums you own, because the object name already carries the affix and there is no collision to prevent; over-affixing just adds noise. (2) The affix is a code identifier only - it must **never** appear in a `Caption`, which is user-visible text; a caption like `'ABC Credit Limit'` leaks the technical prefix onto the screen.

## Best Practice

Affix object names always; affix members only on extensions of base objects; leave own-object fields and enum values unaffixed; keep every `Caption` clean business wording with no affix.

See sample: `affix-only-on-extension-members-never-in-captions.good.al`.

## Anti Pattern

An affixed field on a table you own, an affixed value in an enum you own, or the affix inside a `Caption`. Detection signal: an affix prefix on a `field(...)` inside a `table` you own, on a `value(...)` inside an `enum` you own, or any affix substring inside a `Caption = '...'`.

See sample: `affix-only-on-extension-members-never-in-captions.bad.al`.
