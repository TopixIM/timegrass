# 2026-08-30 19:53 — Post-merge review fixes

- Made the legacy Dynamic `read-path` boundary return `nil` when a remaining path encounters a non-map value.
- Defaulted missing/non-map sessions to `schema/session` before the server-side projection reads fields.
- Added server-tagged regressions for valid/non-map path traversal and missing-session projection.
- Aligned Actions with the current default-Snapshot CLI form and ran all definition tests under the server entry so server-only modules are available.

## 中文摘要

- legacy path 在中间值不是 Map 时安全返回 `nil`。
- server-side projection 在 session 缺失时使用 `schema/session` 默认值。
- 增加对应回归测试，并统一 CI 的新版 CLI 命令。
