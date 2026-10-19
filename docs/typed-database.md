# 数据库类型迁移

运行态改为 DatabaseRecord（today、users、sessions），其中 UserRecord/UserTasks/TaskRecord/NoteRecord 复用已有类型；SessionRecord 使用 Number ID、Option 用户 ID、Route 与 NotificationRecord。

旧文件仍以 Map 格式持久化：加载时先验证现有旧数据，再构造明确的记录；保存时显式投影回旧格式且清空 sessions。不得修改真实 storage.cirru。客户端 diff/patch 继续使用旧 Map 投影，密码仍由 user twig 删除，不发送整个数据库。

所有业务 updater 只接收和返回 DatabaseRecord。未登录、已断开、缺失任务/笔记的操作保持原数据库，不创建 nil 用户、session 或记录。登录/注册提示保留，router 只接受已知页面的有效 payload。

验收包括：客户端/服务端严格检查、definition tests、旧数据往返和错误路径、生成 JS 的业务序列与隐私投影、浏览器交互、CI 成功和 review 清理。既有 Map fixture 测试随契约迁移为有效的 typed fixture，保留原来的隔离/缺失行为断言。

## 验证记录（2026-09-26）

- Calcit / @calcit/procs 0.22.1；16 个模块通过 `caps --strict --ci` 与 toolchain verification。
- `yarn check-sync`：双入口严格检查、14 项客户端 / 90 项服务端定义测试、零 deprecated API。
- `yarn check-typed-database`：独立 `.calcit/js-server` 输出验证实际 JS 的任务/笔记操作、操作序列化、旧 Map 持久化往返、密码过滤与断开会话后的 no-op；日期 FFI 和注册密码哈希由 native tests 覆盖，不伪造 JS native FFI。
- `yarn compile-page && yarn release-page`、Dayjs 和 session-message JS 回归通过；客户端/服务端静态 dynamic-method 报告均为零，完整 `surface-latest-v2` 预览零建议。
- Browser 技能实际操作独立本地 native server：注册、任务创建/完成、历史页、笔记新增/编辑、个人页、退出/登录、错误通知移除、持久化、重启后自动登录和数据恢复。确认日期定时更新为当天；修复 `set-today!` 对 Struct 的旧 `&map:get` 访问。未修改线上存储。
- 修复 `read-sync-metrics` 对 Struct 的旧 `merge`，新增回归。移除没有调用者的旧 `effect-focus`，其余语法由 Calcit structured edit / fix 迁移。

## 边界与质量门禁

不是零 Dynamic 项目：旧客户端投影、序列化输入、异构 UI state 与 ReelState 的库边界仍存在。新 `*-to-map` 函数只在旧存储/客户端投影边界返回异构 Map，不用于内部业务更新；所有业务 updater 和数据库/session/user/route 字段使用闭合类型，没有新增 unsafe-coerce。

formatter 的原始 unresolved slot 统计从 55 到 62，主要因为显式增加了 legacy Map adapter 和输入解码边界，不能把这个数字描述为下降或零债务。已采用双入口严格检查、definition tests、零静态动态方法及实际 native/JS/browser 回归作为明确的 CI 门禁，不恢复或扩大旧 Dynamic baseline。后续客户端投影可以独立收窄，不应重新放宽运行态数据库。

测试服务器在临时目录使用快照副本及合成账户数据；实际页面 URL 必须显式包含 `?mode=dev&port=<test-port>`。仅编译时设置 `mode=dev` 不会替代浏览器运行时参数。临时重启的断线日志和测试期间重新生成 JS 的热更新错误不属于最终验收状态；最终连接上的交互无新增控制台错误。

## 0.30.1 兼容边界的源码审阅

本节对应 Calcit #2080 的消费者迁移，不是上文 0.22.1 历史回放的重新认证。
当前 CLI/runtime 固定为已发布的 0.30.1-alpha.5；Markdown 已独立升级到正式
0.4.58。Cumulo Reel/Recollect 的最终依赖配对、完整原测试及实际浏览器/native
持久化重启验收仍由 [#112](https://github.com/TopixIM/timegrass/issues/112) 跟踪。
不以依赖解析或局部测试替代这些交付门槛。

运行态 `DatabaseRecord` 与 updater 的闭合合同保持不变。保留 nil 的位置须根据
实际数据消费者分类，而不是以计数清零作为目标：

| 边界 | 真实消费合同与不可改变的行为 |
| --- | --- |
| `note-to-map` / `session-to-map` / `task-to-map` / `user-to-map` | 将具体记录的可选时间、标识和用户字段编码为旧存储/wire 的 nil 或真实 payload；Some 0、空字符串不能当作缺失。内部记录继续使用 Option，不把整个数据库改回开放 Map。用户投影仍须过滤密码，不能因为存储编码包含密码就直接发送到客户端。 |
| `app.schema/read-path` | 原 Map-only 兼容 adapter：空路径返回原值；缺失 key、非 Map 中间值返回 nil；nil key、false、0、空字符串和已有叶子身份保留。它本来允许缺失与显式 nil 合流，调用方在实际使用处验证；不能机械替换成容器/失败合同不同的 core `get-in`。 |
| `app.twig.container/twig-container` | 输出原客户端 wire Map。登录判断、用户查找、router 的惰性解码与错误顺序保持；未登录 router 可以是不透明值。history week / today 继续使用旧 wire 值，notes 的旧缺失/非 Map 回退仍保留，不新增业务默认值。不能提前解码未选中路由或改变 nil 用户 key 的既有查找语义。 |
| UI 的 status color、可选 title 与 note prompt | 颜色和子节点的 nil 属于原展示省略，note 文本交给既有 prompt 初值合同；不能把 false、0、空字符串一概省略，不能在本来未执行的事件回调之前验证或增加求值。 |

这些是具名开放边界，不是证明整个客户端投影、框架 state 或匿名 payload 已静态化。
新增内部逻辑应保留已有 Map 参数和具体 payload 的类型关系，缺失使用 Option、失败
使用 Result；只有真正进入上表兼容出口时才按原协议编码。开放输入在实际消费处
验证，不用 `assert-type`、unsafe 或给函数补一个具体返回声明来伪造输入证据。

回归断言优先维护在原定义的 `:tests`：`app.schema` 覆盖记录编码/旧解码和
`read-path` 的混合 key、nil 中间值及叶子；`app.twig.container` 覆盖 router、访客、
notes、错误顺序及 wire 投影；原标题和 note 组件测试覆盖回调次数和惰性分支。
同源 JS、宿主行为、实际隔离浏览器及重启仍复用原脚本和验收路径，不新增计数门禁或
另一套测试运行器。

审查调用点时不能把 `query usages` 的零结果当作可删除证据。当前固定 CLI 对
`schema/read-path` 这类 namespace alias 存在已知漏报（Calcit #2164）；应同时通过
`query ns` 确认 alias，再用 `query search` 的完整 namespace/definition filter
定位真实调用。此问题复用核心已有 issue，不为应用增加扫描工具或绕过原 helper。

以上核验与生产服务器无关。Actions 只执行既有构建、验证和资源上传，不检查服务器
内部元数据，也不代表已经安装或重启生产服务；该类权限不属于语言发布前置。
