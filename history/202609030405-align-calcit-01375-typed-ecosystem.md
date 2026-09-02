# Align Calcit 0.13.75 typed ecosystem

## Context / 背景

Timegrass was still pinned to Calcit 0.13.67 and older Respo ecosystem
releases. Rebuilding against 0.13.75 exposed stricter nominal data, Option,
Unit, style-map and browser lifecycle contracts.

Timegrass 原先固定在 Calcit 0.13.67 与较旧的 Respo 生态版本；升级到
0.13.75 后，需要显式满足 nominal data、Option、Unit、style map 与浏览器
生命周期契约。

## Change / 修改

- Upgrade the Calcit toolchain and released module versions.
- Use nominal struct updates for ReelState and SyncMetrics.
- Make proven Option unwraps and Unit returns explicit.
- Route visibility and heterogeneous style composition through typed adapters.
- Add the native Cirru EDN quality baseline and CI gate.

## Validation / 验证

Using the local Calcit build from calcit-lang/calcit#597 and real repositories
under `/Users/chenyong/repo`, client/server check-only, 20 server tests,
deprecated analysis, the static quality gate, client/server JS codegen, and the
Node 24 Vite production build pass.

Tracking: TopixIM/timegrass#88.
