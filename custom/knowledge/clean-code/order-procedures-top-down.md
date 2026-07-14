---
bc-version: [14..]
domain: clean-code
keywords: [stepdown-rule, ordering, readability, callers-before-callees, navigation]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Order procedures top-down so callers precede callees

## Description

Code reads best as a narrative that descends from high level to detail. Within an object, place public/orchestration procedures first and the helpers they call just below, so a reader meets the overall flow before the specifics. When a helper appears above its caller, the reader hits low-level detail with no context and has to scroll to reconstruct the story.

## Best Practice

Put the entry-point/public procedures at the top and the procedures they call beneath them, in call order (the "stepdown rule"). Keep an event publisher above its subscribers when they live in the same object.

See sample: `order-procedures-top-down.good.al`.

## Anti Pattern

Helper procedures (`ValidateOrder`, `CalculateTotals`) defined at the top of the object with the `ProcessOrder` that calls them buried at the bottom. Detection signal: a procedure is defined before any of its callers, forcing bottom-up reading. Reorder so callers precede callees.

See sample: `order-procedures-top-down.bad.al`.
