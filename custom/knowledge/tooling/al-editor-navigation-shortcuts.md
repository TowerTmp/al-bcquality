---
bc-version: [14..]
domain: tooling
keywords: [vs-code, navigation, shortcuts, go-to-definition, find-references, symbol-search]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Navigate AL by symbol, not by text search

## Description

Understanding a BC codebase - tracing a call chain, checking impact before an edit - is far faster with symbol navigation than with full-text search and scrolling. The high-value VS Code AL shortcuts: **F12** go-to-definition, **Alt+F12** peek definition (without leaving your place), **Shift+F12** find all references, **Ctrl+T** workspace symbol search, **Ctrl+Shift+O** symbols in the current file, **Shift+Alt+F** format document to AL rules.

## Best Practice

Trace references and impact with `Shift+F12` / `F12` / `Ctrl+T` rather than text search - symbol navigation is exact and extension-aware. Peek with `Alt+F12` to check a signature without navigating away. Apply `Shift+Alt+F` to format to AL conventions before committing.

## Anti Pattern

Finding where a procedure is used by grepping the folder and scrolling, or editing a shared procedure without running `Shift+F12` first to see its callers. Detection signal: refactoring a public procedure/field without checking references, then discovering broken callers at compile time.
