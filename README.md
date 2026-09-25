
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
mode=dev calcit calcit.cirru --entry server -w
```

本地浏览器地址需显式带上 `?mode=dev&host=127.0.0.1&port=11009`；`mode=dev`
只设置服务端进程环境变量，不会自动设置浏览器运行时参数。缺少该参数时浏览器会连接
正式服务地址，开发与验收时请先确认控制台显示本地 WebSocket 地址。

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

Calcit 默认执行严格类型检查。浏览器和服务端入口均以严格检查作为门禁；兼容模式
测试仅用于迁移期回归，不能替代严格检查。数据库目前仍是异构结构，updater 的输入
与返回值通过 `app.schema/database` 标记为 `Map<Tag, Dynamic>`；这是过渡边界，
不是字段级模型。用户集合在遍历前进行类型解码。不再用旧的 Dynamic 数量基线作为
合并门禁。数据库字段契约与持久化入口的后续收敛见
[Timegrass #102](https://github.com/TopixIM/timegrass/issues/102)。

服务端读取 `storage.cirru` 时先验证顶层 Map、`:today` 字符串及 `:users`、
`:sessions` Map；缺失字段按默认值补齐，持久化的旧 session 在启动时清空。
字段类型不符会带着 `storage.cirru/:field` 路径报错，不再直接把解析结果断言为
数据库类型。用户、任务、笔记等内层字段仍需继续建模与迁移，见 #102。

任务创建文本和任务 ID 操作采用 String payload，网络入口拒绝 nil/数字，客户端从
投影读取任务 ID 时显式解码。历史周查询使用与服务端日期解析一致的时间格式；
Dayjs adapter 检查与本地业务烟测覆盖该路径。

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

`yarn check-server` 必须使用与 `@calcit/procs` 一致的 Calcit 0.20.0，且严格检查与
definition 测试全部通过；不能以兼容模式测试通过代替它。

Never test a migration against the live `storage.cirru`. Copy it outside the
repository, then verify the same load/persist path used by the server. The
revision-protocol migration was checked against a copy of the real 736,198-byte
state; after a native server run and persistence, both the copy and source kept
SHA-256 `18212a22d8dfdcd9e9f3ecd8cbc7a5fd8975b7644432e4435ea0297a1935b191`.

### License

MIT
