---
description: Draft a pandera.DataFrameModel for a SQL/GBQ table from a sample DataFrame, an information_schema listing, or a dictated column list
argument-hint: [table name, or paste/describe the columns and dtypes]
---

Use the Agent tool with `subagent_type: pandera-schema-scaffolder` to draft
a schema for `$ARGUMENTS`. If no column/dtype information was given, ask for
it (a sample DataFrame, a BigQuery `information_schema.columns` listing, or
a plain column:dtype list) rather than guessing at a table's shape. Relay
the drafted schema back directly.
