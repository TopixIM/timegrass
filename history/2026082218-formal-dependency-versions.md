# 2026-08-22 18:00 — Replace pinned dependency hashes with releases

- Updated the root Calcit dependencies from commit hashes to published SemVer versions.
- Kept the dependency graph on the current Calcit 0.13.29 toolchain.
- Verified the canonical snapshot with `calcit edit format`, `--check-only`, and JavaScript code generation.
- The project still reports its pre-existing high Dynamic-type ratio; this dependency-only change does not alter those definitions.
