
Timegrass
------

Time flies and tasks grow like grass.

### 前端 COS 与 CDN 部署

COS Action 1.2.0 使用已有 `public-base-url` 启用内置引用与公开访问 verify，不复制额外上传校验脚本。PR 资源按仓库/PR 编号/run/attempt 隔离，Vite base 与 COS prefix 使用同一结果；fork PR 保留构建，但不上传。生产 COS 前缀与现有 web/server rsync 路径保持不变。

同一 PR 或生产分支的运行排队，不取消正在执行的上传；job/upload 分别限时 15/10 分钟。工具链版本以 `deps.cirru` 和 `package.json` 为准，客户端/服务端严格类型与业务门禁必须保留。

### Workflow

https://github.com/Cumulo/calcium-workflow

### Local development

```bash
fnm use 24
corepack enable
corepack prepare yarn@4.18.0 --activate
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

`.yarnrc.yml` 明确将 npm 新版本安装隔离期设为一小时，统一用于本地和 CI；不再为
Calcit 单个版本维护免等待例外。这只调整 npm 依赖解析，不影响发版间隔、Cargo 或
Calcit 模块安装，也不替代严格类型、测试、锁文件和 review 门禁。

Calcit 默认执行严格类型检查。浏览器和服务端入口均以严格检查作为门禁，不能用
兼容模式代替。运行态数据库与 updater 输入/返回使用 `DatabaseRecord`，用户、任务、
笔记、session 和路由也有明确字段类型；客户端投影、外部输入及 UI state 仍是显式边界。
不再用 Dynamic 数量基线作为合并门禁，具体合同见[数据库类型迁移](docs/typed-database.md)。

服务端读取 `storage.cirru` 时验证旧 Map 数据，再构造名义记录；保存时转换回兼容的
Map 格式，启动时清空持久化 session。客户端 DOM 查询使用
`respo.ffi.browser/query-selector`，返回 Respo renderer 接受的元素类型，不在应用中
强转 js-ffi 与 Respo 的 DOM 合同。组件 state 保留泛型 StateKey；成员列表保留真实
session key，未登录成员显示“访客”。

本地 `Op :states` 的 cursor 明确为 List，元素仍保留原始 StateKey；解码入口拒绝
nil、数字、字符串或 Map 代替 cursor，不把混合 Tag/String/Number 路径转成字符串。
客户端派发函数明确返回 Unit，更新仍保留其他分支和 store 字段；state payload 的
开放边界尚未收窄，不能据此宣称 UI state 已完全类型化。

任务与已完成任务组件在读取本地 state 时验证 Map，在消费 cursor 时验证 List，
保留额外 state 字段及原 key。自动登录无凭据、凭据形状不合法或宿主拒绝读取时
遵守 Unit 返回合同；Cirru EDN 解析异常仍向上传播，不自动清理或重写凭据。

容器只在已加载分支验证 store、states、session 与选中的 router 为 Map；初始和离线
分支不读取这些数据。未知路由仍显示原 404 内容，store 中的 router 不是 Map 时仍
使用 session router。该校验只确认容器形状，不等于业务字段已经全部具有具体类型。

任务列表的两个排序分支共用 `task-sort-key`：保留原 touched-time / created-time
选择顺序，验证有效时间为 Number 后取反排序。零、负数和原有 nil/false 回退语义保留；
错误的有效字段不会被默默换成另一个时间或默认值。附带测试覆盖选择、失败与倒序结果。

历史页面在入口把投影任务解码为 `FinishedTaskView`（String id/text、Number finished-time），
然后供日期分组、同日排序和行组件复用。缺失或错误字段明确报错；持久化 TaskRecord
继续使用原来的 Option 时间字段。工作任务与历史任务菜单的 Clear 只派发一次关闭状态，
普通选择先验证 Enum 形状及 Tag action，再执行对应操作。

客户端本地根状态引用为 `Ref<Map<Tag,Dynamic>>`，更新结果校验后再写回；内部组件
state 继续保留原始混合 key。Respo renderer 的开放 operation 回调通过
`dispatch-render-operation!` 复用应用操作解码器，将框架的匿名 Enum 规范化为应用 Op，
再进入 typed dispatch；不是直接要求框架已生成名义 Op。非 Enum 或非法 payload
明确报错，不修改本地状态。附带测试覆盖真实 `wrap-dispatch` 的 cursor/payload 调用。
watch 注册与热更新复用同一个泛型渲染回调，init/reload 明确返回 Unit。

站点配置使用 `SiteConfig`，同步链保留 `ReelState<DatabaseRecord>` 的数据库参数，
历史与笔记筛选使用 `HistoryRoute` / `NotesRoute`，不靠调用点的返回断言补类型。
自动登录使用 `storage-get` 的 `Option<String>`：缺失或受宿主限制而无法读取的本地存储
按未找到处理，不强转 JavaScript 返回值；有效凭据仍经过原来的 operation 解码。

任务创建文本和任务 ID 操作采用 String payload，网络入口拒绝 nil/数字，客户端从
投影读取任务 ID 时显式解码。历史周查询使用与服务端日期解析一致的时间格式；
Dayjs adapter 检查与本地业务烟测覆盖该路径。
登录与注册载荷为两个 String 组成的 List；服务端拒绝长度或元素类型错误的载荷，
本地存储自动登录也复用同一入口解码。隔离存储中的注册与刷新后自动登录已验证。
任务、笔记编辑载荷分别使用带 `id`/`text` String 字段的 Struct；网络入口将
Cirru EDN 解析出的 Struct 转成 Map 后按声明类型解码。定义测试覆盖序列化往返，
隔离浏览器中编辑任务和笔记并刷新后均能读到更新。

### Upgrade validation

使用已发布的模块版本，并在提交前验证完整依赖图：

```bash
caps --ci
caps verify --toolchain
calcit edit format
calcit fix --workflow strict --verify --format edn
yarn check-client
yarn compile-page
yarn release-page
yarn check-dayjs-adapter
yarn check-server
```

`yarn check-server` 必须使用与 `deps.cirru`、`@calcit/procs` 一致的已发布 Calcit，且严格检查与
definition 测试全部通过；开发编译器验证不能替代正式工具链验收。
JS 回归必须运行 `yarn check-title-contract`、`yarn check-session-messages` 和
`yarn check-typed-database`；标题、登录/注册回调、键盘事件转发和 StateKey 的语义断言维护在定义的 `:tests` 中，现有
JS 脚本负责回放，不另建一份断言。`check-title-contract` 同时验证登录回调的宿主存储边界：
使用隔离对象检查派发/写入顺序、不可用存储和异常传播，不写入真实浏览器登录信息；同时验证键盘回调保留原函数、事件和 dispatcher，并传播原异常。登录输入框的事件回调声明 Map 事件与应用 Op 派发合同；生成 JS 的宿主测试验证用户名/密码只改对应字段、保留原始混合 key cursor、每次只派发一次，并传播原派发异常。
该回放同时执行容器的离线文本、未知路由、session router 回退和非法容器测试；只加载
本次隔离编译的产物，通过已有 Vite 解析浏览器依赖，不启动 HTTP/WebSocket 监听。
这类宿主回放不是实际浏览器挂载验收，后者仍须单独执行。
`caps --ci` 可能报告传递依赖的 patch 版本选择警告，
需核对选中版本并运行上述回归，不把普通安装成功描述为 `caps --strict` 通过。

### 限制

- 当前依赖 pin 不代表迁移已验收；发布工具链与完整消费者验收进度见 [Timegrass #112](https://github.com/TopixIM/timegrass/issues/112)。
- 双入口普通检查、源码编译器通过或跨版本 JS 烟测均不能替代匹配正式版本的完整严格工作流；不删除 CI 的 `fix --workflow strict --verify` 门禁。

Never test a migration against the live `storage.cirru`. Copy it outside the
repository, then verify the same load/persist path used by the server. The
revision-protocol migration was checked against a copy of the real 736,198-byte
state; after a native server run and persistence, both the copy and source kept
SHA-256 `18212a22d8dfdcd9e9f3ecd8cbc7a5fd8975b7644432e4435ea0297a1935b191`.

### License

MIT
