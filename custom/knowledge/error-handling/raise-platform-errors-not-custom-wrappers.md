---
bc-version: [14..]
domain: error-handling
keywords: [platform-errors, testfield, fielderror, get, findfirst, error-wrapping, standard-errors]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Raise the platform's own errors instead of custom wrappers

## Description

The AL runtime already produces clear, localized error messages when a standard record operation fails, and `TestField`/`FieldError` state precisely which field and value are at fault. Catching those failures and re-throwing a hand-written `Error('...')` almost always yields a vaguer message, drops the field context, and adds a Label constant to maintain. Let the platform surface its own error, and reserve custom `Error` calls for genuine business rules the platform cannot know about.

## Best Practice

Call `Get`, `Modify`, `Insert`, `Delete`, and `Rename` directly and let the platform raise on failure. For `FindFirst`/`FindSet`/`FindLast`, branch on the boolean result rather than throwing on `false`. Use `TestField`/`FieldError` for missing-value checks so the message names the field. Write a custom `Error` only for a domain rule the platform cannot enforce, or when a specification dictates the exact message text.

See sample: `raise-platform-errors-not-custom-wrappers.good.al`.

## Anti Pattern

Wrapping a standard operation so its native error is replaced by vaguer custom text, e.g. `if not Customer.Get(No) then Error('Customer does not exist.');` or `if not SalesLine.Modify(true) then Error('Update failed.');`. Detection signal: an `if not <Rec>.Get/Modify/Insert/Delete/Rename(...) then Error(...)` pattern, or an `if not <Rec>.FindFirst/FindSet/FindLast() then Error(...)` whose message is not mandated by a spec. Delete the wrapper and call the operation directly, or branch on the find result.

See sample: `raise-platform-errors-not-custom-wrappers.bad.al`.
