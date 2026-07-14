---
bc-version: [14..]
domain: style
keywords: [tableextension, pageextension, enumextension, reportextension, naming, object-name, extension]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Do not put "Ext" in extension object names

## Description

Extension objects (`tableextension`, `pageextension`, `enumextension`, `reportextension`) declare their nature through the object-type keyword itself. Adding an "Ext" suffix to the object name repeats that information and adds noise without conveying anything new. Name an extension after the base object it extends, prefixed with the app affix, and let the keyword communicate that it is an extension.

## Best Practice

Name the extension `"[Affix] [BaseName]"`, abbreviating the base name if needed to stay within the 30-character limit. The keyword already says "extension", so the name should read as the thing being extended.

See sample: `no-ext-suffix-in-extension-object-names.good.al`.

## Anti Pattern

An extension object whose name ends in "Ext" (or "Extension"), such as `tableextension 50100 "ENR Customer Ext"`. Detection signal: an object-name string on a `tableextension`/`pageextension`/`enumextension`/`reportextension` declaration that ends with "Ext" or "Extension". Rename the object and update every reference to it.

See sample: `no-ext-suffix-in-extension-object-names.bad.al`.
