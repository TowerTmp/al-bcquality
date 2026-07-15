---
bc-version: [14..]
domain: architecture
keywords: [event-subscriber, codeunit-organization, cohesion, maintainability, singleinstance]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Group event subscribers into codeunits by domain

# Description

Organize event subscribers into codeunits by business domain (or by cross-cutting concern) - not one monolith holding every subscriber, and not one codeunit per subscriber. A single giant subscriber codeunit causes constant merge conflicts and slow navigation; one-codeunit-per-subscriber adds load/initialization overhead and deployment noise. Domain grouping keeps related handlers and their shared helpers together and easy to find.

## Best Practice

One subscriber codeunit per domain or feature (e.g. `CDV Sales Discount Subscribers`), and separate codeunits for cross-cutting concerns (audit, telemetry). Split a codeunit when it grows past a sensible size or starts spanning unrelated domains. Keep `SingleInstance` subscribers consolidated to limit per-instance overhead.

See sample: `organize-subscribers-by-domain.good.al`.

## Anti Pattern

A single `App Subscribers` codeunit holding every subscriber across all features, or a separate tiny codeunit for each individual subscriber. Detection signal: one subscriber codeunit with handlers spanning unrelated domains, or dozens of one-subscriber codeunits.

See sample: `organize-subscribers-by-domain.bad.al`.
