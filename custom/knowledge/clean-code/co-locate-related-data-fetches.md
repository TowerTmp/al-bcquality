---
bc-version: [14..]
domain: clean-code
keywords: [data-access, cohesion, procedure-design, record-read, fetch, feature-envy, chained-procedures]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Fetch the data for one business result in one place

## Description

When a single business result needs fields from several records, reading them in one procedure keeps the data access cohesive and lets the reader see the whole query at a glance. Splitting one logical read across a chain of procedures that only ever call each other scatters the intent, invites re-reading the same record more than once, and makes the true cost of the operation hard to see. If procedure A always calls B to finish the same result and B is never used alone, they are one operation wearing two names.

## Best Practice

Gather every record read needed for one result inside a single procedure, using `SetLoadFields` to pull only the fields you use. If a helper is never called independently and exists only to continue the same fetch, inline it. Pass the assembled values out through `var` parameters or a return value.

See sample: `co-locate-related-data-fetches.good.al`.

## Anti Pattern

A chain such as A -> B -> C where all three exist solely to produce one composite result, often re-reading a record a later link already had. Detection signal: a procedure whose entire body is a call to one private procedure in the same object, or two procedures that each read part of the same entity for the same caller. Collapse the chain into one procedure.

See sample: `co-locate-related-data-fetches.bad.al`.
