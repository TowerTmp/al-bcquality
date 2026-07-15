---
bc-version: [14..]
domain: tooling
keywords: [github-copilot, coding-agent, issue, delegation, acceptance-criteria, context]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Front-load full context when delegating a BC task to a Copilot coding agent

## Description

A GitHub Copilot coding agent works from an Issue with only the Issue text plus the repository as context, and it cannot ask clarifying questions. A delegated BC task therefore has to state everything up front: exact object IDs/names/types, the naming/affix convention, the data model and relationships, the business/validation rules, and testable acceptance criteria. A vague Issue produces wrong IDs, wrong names, and rework.

## Best Practice

Write the Issue with: an **Object Details** block (IDs, types, fields), the **affix and naming** rules, the **data model + relationships**, explicit **validation/business rules**, and a checklist of **acceptance criteria + expected deliverables**. Reference the org's conventions explicitly rather than saying "follow standard patterns".

## Anti Pattern

A one-line Issue such as "add a priority field to sales orders" with no object IDs, names, types, or rules. Detection signal: a delegated Issue that lacks object IDs, the naming/affix convention, or acceptance criteria - the agent will guess and collide.
