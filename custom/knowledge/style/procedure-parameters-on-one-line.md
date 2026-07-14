---
bc-version: [14..]
domain: style
keywords: [procedure, parameter-list, signature, one-line, formatting, readability]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Keep a procedure's parameter list on one line

## Description

An org convention: a procedure declaration keeps its entire parameter list on a single physical line - the opening `(`, every parameter, and the closing `)` stay on the same line as the procedure name and return type. A one-line signature is scanned in a single glance, keeps call sites and definitions visually symmetric, and produces smaller, clearer diffs when a parameter is added or renamed. This is a deliberate house style that overrides the platform's tolerance for wrapped signatures; it is not a Microsoft requirement.

## Best Practice

Declare every parameter on the same line as `procedure`, however many there are. If a signature feels too long to read on one line, treat that as a signal the procedure takes too many parameters - reduce them (pass a record or a parameter object) rather than wrapping the list.

See sample: `procedure-parameters-on-one-line.good.al`.

## Anti Pattern

A parameter list broken across multiple physical lines, typically with `(` at the end of the `procedure` line and one parameter per following line. Detection signal: a `procedure` declaration whose `(`...`)` parameter list spans more than one physical line. Collapse it onto the procedure-name line.

See sample: `procedure-parameters-on-one-line.bad.al`.
