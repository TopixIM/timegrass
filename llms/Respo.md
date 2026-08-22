# Respo Development Guide for Calcit Agents

This guide describes the current Respo project workflow. The project source is
stored in the canonical `calcit.cirru` Snapshot. Keep that file as the only
Snapshot representation and do not introduce a second serialized source file.

## Before editing

Read the current agent guidance before using any Calcit mutation command:

```bash
calcit docs agents --full
calcit docs read upgrade
```

Use the current `calcit` CLI. Normal execution is a single run; add `-w` or
`--watch` only when a watcher is explicitly needed.

## Project discovery

Project-aware commands take `calcit.cirru` as their entry file:

```bash
calcit calcit.cirru query ns
calcit calcit.cirru query ns respo.core
calcit calcit.cirru query defs respo.core
calcit calcit.cirru query peek respo.core/defcomp
calcit calcit.cirru query def respo.core/render!
calcit calcit.cirru query find render!
calcit calcit.cirru query usages respo.core/render!
calcit calcit.cirru query error
```

For Cirru syntax experiments that do not load the project, use the top-level
Cirru tools:

```bash
calcit cirru parse -e 'defn f (x) (+ x 1)'
calcit cirru format '["div", {}, ["<>", "hello"]]'
```

## Inspecting and editing definitions

Read the complete definition before making a structural change. Use the
project-aware `tree` and `edit` commands for Snapshot changes; do not edit the
serialized Snapshot with a text editor.

```bash
calcit calcit.cirru query def respo.app.updater/updater
calcit calcit.cirru tree show respo.app.updater/updater -p "" -d 1
calcit calcit.cirru tree show respo.app.updater/updater -p "2,1" -d 1

# Prefer content-based tree operations when available.
calcit calcit.cirru tree search-replace respo.app.updater/updater \
  --code 'old-value' --with 'new-value'

calcit calcit.cirru edit add-ns respo.app.feature-x
calcit calcit.cirru edit add-import respo.app.feature-x \
  --code 'respo.core :refer $ defcomp div span'
```

For larger edits, put the Cirru or JSON input in a temporary file and pass it
with `--file`. Use `--code` for short snippets. The current mutation commands
do not require a legacy standard-input flag.

After every Snapshot edit, format and inspect the diff:

```bash
calcit calcit.cirru edit format
git diff -- calcit.cirru
```

When replacing a definition or moving namespaces, prefer the dedicated
`edit` commands and use `tree rewrite` for replacements that need references
to original nodes. For sibling index operations, work from the end toward the
beginning or re-query paths after each mutation.

## Validation

Install dependencies from `deps.cirru`, then run the canonical checks:

```bash
caps --ci
calcit calcit.cirru edit format
git diff --exit-code -- calcit.cirru
calcit calcit.cirru --check-only
calcit calcit.cirru analyze deprecated --summary-only --format json
calcit calcit.cirru js
yarn install --immutable
yarn vite build --base=./
```

`calcit eval` is useful for small semantic or type experiments, but it is not
a substitute for running the complete project. Keep the snippet top-level
and remember that `let` bindings use pairs, for example:

```bash
calcit calcit.cirru eval 'let ((x 1)) (+ x 2)'
```

Warnings from type checking are intentional failures in validation. Inspect
`.calcit/error.cirru` for the full diagnostic context.

## Runtime and release workflow

The normal JavaScript build is:

```bash
calcit calcit.cirru js
yarn vite build --base=./
```

Use `calcit calcit.cirru -w` or `calcit calcit.cirru js -w` only for an
explicit watch session. Keep Node and Yarn versions aligned with
`packageManager` and the repository workflow; CI should activate Corepack
before Yarn commands.

When changing dependencies, update `deps.cirru`, run `caps --ci`, and verify
the generated project module view. Do not hand-edit generated module contents.

## Debugging checklist

1. Run `calcit docs agents --full` and `calcit docs read upgrade` if command
   behavior is unclear.
2. Use `query def`, `query usages`, and `tree show` before editing.
3. Re-run `edit format`, `--check-only`, and JavaScript generation after each
   Snapshot change.
4. Check `.calcit/error.cirru` when a command reports a shortened error.
5. Keep stdout free of diagnostics when validating scripts that consume JSON.

The project is maintained with the canonical Calcit Snapshot and the current
`calcit` command family. Examples in older notes are historical and should not
be copied into new workflows.
