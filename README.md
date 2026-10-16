
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
WSS_BIND_ADDRESS=127.0.0.1 mode=dev calcit calcit.cirru --entry server -w
```

本地浏览器地址需显式带上 `?mode=dev&host=127.0.0.1&port=11009`；`mode=dev`
只设置服务端进程环境变量，不会自动设置浏览器运行时参数。缺少该参数时浏览器会连接
正式服务地址，开发与验收时请先确认控制台显示本地 WebSocket 地址。

`WSS_BIND_ADDRESS` 通过正式 calcit-wss 0.2.36 的 String 地址参数控制 native 监听；
本机开发/验收显式设置 `127.0.0.1`。未设置时仍使用原来的 `0.0.0.0`，不改变生产默认值；
地址只接受 IP 字面量，端口仍由原 `port` 环境变量控制。不要将本机连接 URL 当作监听隔离证明。

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
Map 格式，启动时清空持久化 session。验证后的 `today` / `users` 先投影并解码为
`LegacyDatabaseView`，再供 `DatabaseRecord` 构造复用，不逐字段还原 nil；不修改输入
Map，仍按原逻辑忽略构造不需要的根元数据，`users` 内部再逐项解码为 `UserRecord`。
旧用户校验从同一不可变 Map 的 keys 读取现存值，保留值的泛型类型后再校验记录，
不先把读取结果恢复为 nil；非法记录载荷与空 Map 仍按原合同处理。
客户端 DOM 查询使用
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
使用 session router；该回退按需读取，未选中的 router 不提前校验。缺少必需 session
或回退 router 时，错误带上字段路径。该校验只确认容器形状，不等于业务字段已经全部具有具体类型。
导航参数按原顺序检查为 Bool、Option<Number> 和 Tag，正文复用这些结果判断登录与路由，
不再次从开放 Map 读取并还原 nil；离线分支、session router 的惰性回退及必需字段的错误顺序不变。

任务列表的两个排序分支共用 `task-sort-key`：保留原 touched-time / created-time
选择顺序，验证有效时间为 Number 后取反排序。零、负数和原有 nil/false 回退语义保留；
错误的有效字段不会被默默换成另一个时间或默认值。附带测试覆盖选择、失败与倒序结果。

历史页面在入口把投影任务解码为 `FinishedTaskView`（String id/text、Number finished-time），
然后供日期分组、同日排序和行组件复用。缺失或错误字段明确报错；持久化 TaskRecord
继续使用原来的 Option 时间字段。页面的年份和周序先解码为 `HistoryRouteView`，只要求
原来的两个 Number 字段，保留零值与原 Map 的额外字段，不额外要求服务端的 start/end。
工作任务与历史任务菜单的 Clear 只派发一次关闭状态，
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
登录组件在入口验证用户名和密码均为 String，笔记组件验证路由的年份和月份均为 Number；
缺失或类型错误时明确报错，不填业务默认值。空字符串和零月份保持有效；首次登录的
初始 state 逻辑不变。验证只投影必需字段，输入事件仍更新原始 state Map，保留额外字段和混合 key cursor。
登录、任务与总览组件通过 `get-in` 读取 state-tree 的固定元数据；入口先检查 Map，cursor 在消费处检查 List。
StateKey 泛型、Tag/String/Number 子分支和原 `:data` 回退保持不变，非 Map 不会因路径 API 的 nil-base 行为被默默接受。
任务、笔记编辑载荷分别使用带 `id`/`text` String 字段的 Struct；网络入口将
Cirru EDN 解析出的 Struct 转成 Map 后按声明类型解码。定义测试覆盖序列化往返，
隔离浏览器中编辑任务和笔记并刷新后均能读到更新。

登录信息和笔记路由先从原 Map 筛出必需字段，再解码为 `LoginState` / `NotesRoute`，
不把缺失字段先恢复成 nil；原 state 的额外字段仍保留，空字符串和零月份仍有效。
任务 ID 复用已解码的 `TaskRecord`。旧存储的 nil 时间、用户可选字段和集合默认逻辑
在 Option 分支内处理，不能把 false、0 或空字符串误当成缺失，也不能借迁移扩大 Dynamic。

升级验收必须使用 `deps.cirru` 与 `@calcit/procs` 指定的同一已发布版本，重跑完整严格
工作流、原定义测试、同源 JS 回放和实际浏览器/native 重启验证。旧 0.29.3 的浏览器
记录不能代替新配对验收；最新证据及尚未完成的类型迁移见 [Timegrass #112](https://github.com/TopixIM/timegrass/issues/112)。

### Upgrade validation

使用已发布的模块版本，并在提交前验证完整依赖图：

```bash
caps --strict --ci
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
JS 脚本负责回放，不另建一份断言。定义测试中的布尔检查必须写成 `assert= true <条件>`；
仅返回 false 不会让测试失败，不能把“执行过检查表达式”当成“断言通过”。
`check-title-contract` 同时验证登录回调的宿主存储边界：
使用隔离对象检查派发/写入顺序、不可用存储和异常传播，不写入真实浏览器登录信息；同时验证键盘回调保留原函数、事件和 dispatcher，并传播原异常。登录输入框的事件回调声明 Map 事件与应用 Op 派发合同；生成 JS 的宿主测试验证用户名/密码只改对应字段、保留原始混合 key cursor、每次只派发一次，并传播原派发异常。
两个输入回调在 Option 分支内直接得到 String，不先恢复开放的 nil 值；缺失与 nil 仍使用原有 `str nil` 结果，
false、零、空字符串和普通文本保留原转换行为。附带测试通过同一 JS 运行器验证这六类输入、额外字段与单次派发。
该回放同时执行容器的离线文本、未知路由、session router 回退和非法容器测试；只加载
本次隔离编译的产物，通过已有 Vite 解析浏览器依赖，不启动 HTTP/WebSocket 监听。
这类宿主回放不是实际浏览器挂载验收，后者仍须单独执行。
`caps --strict --ci` 会拒绝有冲突的传递依赖图；安装成功后仍需核对选中版本并运行
上述回归，不能以依赖解析成功代替类型和实际业务验收。

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
