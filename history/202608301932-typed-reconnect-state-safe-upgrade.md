# 2026-08-30 19:32 — Typed reconnect and state-safe Calcit upgrade

- Upgraded Calcit and `@calcit/procs` together to 0.13.66 and aligned every Calcit module to a released tag, including `cumulo-reel` 0.0.30 and `ws-edn` 0.0.19.
- Replaced removed `tag-match` calls with `match`, migrated legacy map access to explicit Dynamic-boundary helpers, and cleared client/server preprocessing warnings.
- Added a nominal `WsClient` holder plus a typed `ConnectionRecoveryAction` policy for page-touch, visibility, and online recovery. Hot reload now replaces the active data handler.
- Added concrete `Unit` contracts to the client lifecycle callbacks; project-wide Dynamic usage dropped to 91/117 analyzed positions (77.8%) while the legacy database and explicit WebSocket FFI boundary remain Dynamic.
- Kept the persisted database as its existing Cirru EDN map. A read-only copy of the real state completed parse/persist/format/parse semantic round-trip; the live file's size and digest remained unchanged.
- Verified strict module resolution, client/server checks, deprecated scan, the recovery policy test, canonical formatting, Node 24/Yarn 4.12 immutable install, Calcit JS codegen, and the Vite 8 production build.

## 中文摘要

- Calcit 与 `@calcit/procs` 同步升级到 0.13.66，所有 Calcit 模块统一使用正式 tag。
- 增加 typed reconnect 恢复策略，但不改变旧版 patch 协议和持久化数据结构。
- 使用真实 `storage.cirru` 的只读副本完成语义 round-trip；原文件大小与哈希均未变化。
