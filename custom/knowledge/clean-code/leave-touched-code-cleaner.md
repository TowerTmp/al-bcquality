---
bc-version: [14..]
domain: clean-code
keywords: [boy-scout-rule, incremental-improvement, code-decay, refactoring-scope, dataclassification]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Leave the code you touch a little cleaner

## Description

When you modify a file, take the small, safe improvements in the code you are already touching — name a magic value, fix a misleading identifier, add a missing property, delete adjacent dead code. These incremental fixes stop a codebase from decaying. The discipline is bounded: improve what you touch, do not launch an unrelated sweeping refactor in the same change.

## Best Practice

While making your change, tidy the immediate area: set a missing `DataClassification`, replace a nearby literal with a named constant, remove dead code next to your edit. Keep the cleanup scoped to the block you are working in so the diff stays reviewable.

See sample: `leave-touched-code-cleaner.good.al`.

## Anti Pattern

Adding a new field to a table extension while leaving the adjacent field you just edited with `DataClassification = ToBeClassified` and an unnamed magic default. Detection signal: obvious, trivially-fixable defects left untouched inside the exact block being modified. Fix them alongside the change.

See sample: `leave-touched-code-cleaner.bad.al`.
