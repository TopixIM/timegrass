# Respo Development Guide for Calcit Agents

This project stores its source in the canonical `calcit.cirru` Snapshot. Keep
that as the only serialized source file; do not add or restore `compact.cirru`.

## Before editing

Use the current Calcit CLI and read its live guidance before any Snapshot
mutation:

```bash
calcit docs agents --full
calcit docs read upgrade
```

For detailed Calcit syntax, tree editing, type analysis, and CLI options, use
`calcit docs read <topic>` or `calcit docs search <keyword>` instead of
duplicating those manuals here.

## Respo-specific discovery

Use the project Snapshot explicitly when inspecting Respo code:

```bash
calcit calcit.cirru query ns respo.core
calcit calcit.cirru query defs respo.core
calcit calcit.cirru query def respo.core/defcomp
calcit calcit.cirru query usages respo.core/render!
```

Prefer the installed Respo module documentation for API details. Keep changes
within the application namespaces unless the task explicitly targets the
Respo library.

## Editing and validation

Use `calcit edit` and `calcit tree` for Snapshot changes. After editing, run:

```bash
calcit edit format
calcit calcit.cirru --check-only
calcit calcit.cirru js
caps --strict --ci
yarn install --immutable
yarn vite build --base=./
```

Run only the commands that match the changed area when a full build is not
needed. Normal execution is a single run; add `-w` or `--watch` only for an
intentional watch session. Keep workflow Node/Yarn versions aligned with the
repository configuration.

When dependencies change, update `deps.cirru` with `caps`, use formal release
versions, and verify the resulting module graph. Never reference deprecated
`cr`, `compact.cirru`, `lilac`, or `memof` in new project changes.
