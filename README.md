
Timegrass
------

Time flies and tasks grow like grass.

### Workflow

https://github.com/Cumulo/calcium-workflow

### Local development

```bash
fnm use 24
corepack enable
corepack prepare yarn@4.12.0 --activate
caps --ci
yarn install --immutable

# browser client and static assets
yarn watch-page
yarn dev-page

# realtime server
mode=dev calcit calcit.cirru --entry server --compat-types -w
```

`calcit.cirru` now uses explicit entries: the default browser entry runs in
JavaScript mode and the `server` entry runs natively. `storage.cirru` remains
Cirru EDN and is loaded with `parse-cirru-edn` then written with
`format-cirru-edn`; its existing on-disk shape is preserved, with only runtime
sessions omitted as before.

The browser and server use nominal `ClientMessage` and `ServerMessage`
envelopes. Snapshots and patches carry monotonic revisions; the server advances
each client's diff baseline only after an ACK. Revision mismatch or invalid
patches are rejected atomically and request a fresh snapshot. Visibility and
heartbeat messages let inactive tabs stop receiving projections, while bounded
WebSocket backpressure retains only the newest dirty revision for retry.

The server coalesces updater-driven synchronization instead of scanning every
client on a fixed render interval. `read-sync-metrics` exposes patch/snapshot
attempts, UTF-8 payload bytes, diff latency, resync count, pending clients, and
slow clients. See [docs/realtime-sync.md](docs/realtime-sync.md) for the protocol,
failure behavior, and real slow-reader evidence.

Keep the Calcit CLI and `@calcit/procs` runtime on the same version. The local
development command starts Vite with `--force` so stale optimized dependencies
cannot retain a previous runtime after an upgrade.

Calcit 默认执行严格类型检查。浏览器入口已使用严格检查与生成；服务端仍有旧 updater
契约需要迁移，因此开发时暂用 `--compat-types` 运行，但 CI 最终仍执行服务端严格检查。
迁移期先让兼容测试和浏览器构建完整运行，再报告服务端的实际类型阻断，不再用旧的
Dynamic 数量基线作为合并门禁。数据库字段契约与持久化入口见
[Timegrass #102](https://github.com/TopixIM/timegrass/issues/102)。

### Upgrade validation

使用已发布的模块版本，并在提交前验证完整依赖图：

```bash
caps --ci
caps verify --toolchain
calcit edit format
calcit calcit.cirru --entry server --compat-types test --require-match
yarn check-client
yarn compile-page
yarn release-page
yarn check-dayjs-adapter
yarn check-server
```

`yarn check-server` 是尚未通过的严格门禁；不能以兼容模式测试通过代替它。

Never test a migration against the live `storage.cirru`. Copy it outside the
repository, then verify the same load/persist path used by the server. The
revision-protocol migration was checked against a copy of the real 736,198-byte
state; after a native server run and persistence, both the copy and source kept
SHA-256 `18212a22d8dfdcd9e9f3ecd8cbc7a5fd8975b7644432e4435ea0297a1935b191`.

### License

MIT
