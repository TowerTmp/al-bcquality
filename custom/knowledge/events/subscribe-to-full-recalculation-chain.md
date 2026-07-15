---
bc-version: [14..]
domain: events
keywords: [onaftervalidate, recalculation, sales-line, pricing, subscriber, overwrite]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Subscribe to every field in BC's recalculation chain, not just one

## Description

When your extension sets a field that BC's standard logic also recalculates, subscribe to `OnAfterValidate` on **every** field in that recalculation chain - not only the field you first think of. BC re-runs its pricing/discount logic whenever a related field validates, so a value applied on one trigger is silently overwritten on the next user edit. For example a custom `"Line Discount %"` on a Sales Line is recalculated by BC when `"No."`, `Quantity`, or `"Unit Price"` validate; subscribing only to `"No."` means the value survives selecting the item but is wiped when the user then changes the quantity.

## Best Practice

Identify the target field's full recalculation chain (read the standard `OnValidate` code for the fields that call `Validate` on your target), then subscribe to `OnAfterValidate` on each of those fields and delegate to one management procedure.

See sample: `subscribe-to-full-recalculation-chain.good.al`.

## Anti Pattern

Setting a BC-recalculated field from a single subscriber while other fields in the chain are unhandled. Detection signal: a subscriber that assigns a standard calculated field (discount, price, amount) on one `OnAfterValidate` while other known chain fields (e.g. Quantity, Unit Price) have no subscriber - the value survives the first edit and is overwritten on the next.

See sample: `subscribe-to-full-recalculation-chain.bad.al`.
