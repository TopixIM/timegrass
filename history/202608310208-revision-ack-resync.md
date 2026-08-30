# 2026-08-31 02:08 — Revision/ACK/resync migration

- Migrated Timegrass from attempted-send cache advancement and a 200 ms render scan to typed `ClientMessage`/`ServerMessage` envelopes, per-client ACK baselines, updater-triggered coalescing, bounded retry, and explicit active/idle/resume state.
- Added atomic client patch validation, nominal Recollect change operations, snapshot recovery, typed transport outcomes, and synchronization metrics using UTF-8 payload byte counts.
- Added 17 protocol tests; the server entry now passes 20/20 tests and both client/server entry checks complete without preprocessing warnings. Reachable Dynamic type usage dropped from roughly 72% during the initial scaffold to 31.9% after boundary schemas.
- Fixed a state-safety regression exposed by native validation: typed configuration field access had turned `storage-file` into an `Option`, causing the server to report `Found no data`. The path is now a concrete `String`, and persistence explicitly unwraps nominal `ReelState` at the atom boundary.
- Verified a real raw-WebSocket slow reader: 65,536 buffered bytes, repeated resync snapshots, final revision-3 convergence, then an ACK-based revision 3→4 patch. No transport failure or false disconnect occurred.
- Loaded and persisted a copy of the real 736,198-byte `storage.cirru`; the copy and untouched source retained SHA-256 `18212a22d8dfdcd9e9f3ecd8cbc7a5fd8975b7644432e4435ea0297a1935b191`.

## 中文摘要

- Timegrass 已迁移到带 revision/ACK/resync 的 nominal 协议，并以 updater 驱动的 16 ms 合并同步替代 200 ms 全量扫描。
- 客户端 patch 只在 revision 匹配且 change-op 全部通过 nominal 校验时原子提交；服务端仅在 ACK 后推进 diff 基线，背压时保留最新 dirty revision。
- 原生回归发现并修复 `storage-file` 被新类型语义变成 `Option` 的风险；真实状态副本完成加载、更新、持久化和 Ctrl-C 生命周期，原文件未改变。
