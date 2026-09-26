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
