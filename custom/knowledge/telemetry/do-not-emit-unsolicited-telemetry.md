---
bc-version: [14..]
domain: telemetry
keywords: [telemetry, logmessage, featuretelemetry, application-insights, session-logging, over-engineering, privacy]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Do not emit telemetry unless the specification asks for it

## Description

Telemetry (`Session.LogMessage`, the `FeatureTelemetry` codeunit) is valuable only when someone has decided what to measure and why. Adding it "as a best practice" to ordinary operations produces noise in Application Insights, inflates the code, forces `Locked = true` Label constants that must be maintained, and widens the privacy surface by shipping runtime data off-box. Emit telemetry only where a requirement names the operation to instrument; otherwise write none.

## Best Practice

Implement the business logic and stop there. If the specification does not mention telemetry, logging, or Application Insights, the code contains zero `Session.LogMessage` and `FeatureTelemetry` calls. When telemetry is genuinely required, scope it to the specific event the spec calls out, with an agreed event ID and data classification.

See sample: `do-not-emit-unsolicited-telemetry.good.al`.

## Anti Pattern

Sprinkling `Session.LogMessage(...)` (and its dedicated Label) into routine inserts, lookups, or calculations that no requirement asked to be traced. Detection signal: a `Session.LogMessage` or `FeatureTelemetry.LogUsage`/`.LogError` call, together with a telemetry-only Label constant, in code whose spec never mentions telemetry or logging. Delete the call and the Label.

See sample: `do-not-emit-unsolicited-telemetry.bad.al`.
