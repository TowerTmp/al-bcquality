---
bc-version: [14..]
domain: data-modeling
keywords: [autoincrement, primary-key, integer-key, entry-no, insert, sequence]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Use `AutoIncrement` for integer primary keys on non-temporary tables

## Description

A non-temporary table whose primary key is a single Integer field (a typical "Entry No." ledger or log table) should let the platform assign the next number by declaring `AutoIncrement = true` on that field. The platform then generates a gap-free, concurrency-safe sequence on `Insert` without any application code. Computing the next value manually with a `FindLast` / `max + 1` read is slower, races under concurrent inserts (two sessions can read the same maximum), and adds a helper procedure that exists only to reinvent a platform feature. `AutoIncrement` does not work on temporary tables, which must still assign the key manually.

## Best Practice

Declare `AutoIncrement = true` on the Integer primary-key field of a non-temporary table and just call `Insert()` - the platform fills the key. Do not read the last record or keep a counter to compute the next number.

See sample: `autoincrement-integer-primary-key.good.al`.

## Anti Pattern

Leaving the Integer primary key without `AutoIncrement` and assigning it manually before `Insert`, typically via a "get next entry no." helper that does `FindLast` then `+ 1`. Detection signal: on a non-temporary table with a single Integer PK, code that reads the last record or `Count` to derive `"Entry No." := Last + 1` before inserting, and/or a PK field definition missing `AutoIncrement = true`.

See sample: `autoincrement-integer-primary-key.bad.al`.
