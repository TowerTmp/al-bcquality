---
bc-version: [14..]
domain: style
keywords: [blank-line, whitespace, spacing, procedure, begin, end, readability]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Keep blank lines meaningful: one between procedures, none as clutter

## Description

Blank lines are a signal, not decoration. A single blank line between procedures separates them cleanly, but stray blank lines inside a body dilute that signal and make short procedures look longer than they are. Never use double (consecutive) blank lines, and never place a blank line immediately after `begin` or immediately before `end`, where it only pushes the body away from its delimiters.

## Best Practice

Use exactly one blank line between procedures. Inside a procedure, keep the body flush against `begin` and `end` with no leading or trailing blank line, and use a single blank line only to separate genuine logical sections in a longer body.

See sample: `no-blank-line-clutter.good.al`.

## Anti Pattern

Consecutive blank lines between procedures, or a blank line right after `begin` or right before `end`. Detection signal: two or more blank lines in a row, a blank line as the first line after `begin`, or a blank line as the last line before `end`. Remove them.

See sample: `no-blank-line-clutter.bad.al`.
