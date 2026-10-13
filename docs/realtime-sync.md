# Revision/ACK/resync protocol / Revision、ACK 与重同步协议

Timegrass follows the Calcium Workflow realtime model: business operations are
processed serially by the server updater, each client receives a filtered twig
projection, and Recollect sends only the diff from that client's acknowledged
baseline. Respo renders the resulting client store.

Timegrass 遵循 Calcium Workflow 的实时模型：业务操作由服务端 updater 串行处理；每个客户端只接收经过过滤的 twig 投影；Recollect 基于该客户端已经确认的基线发送增量，Respo 再渲染客户端 store。

## Wire protocol / 传输协议

Browser-to-server traffic uses nominal `ClientMessage` variants:

- `:dispatch Op` carries a nominal business operation.
- `:sync/active`, `:sync/heartbeat`, `:sync/idle`, and `:sync/resume` carry the browser's current revision.
- `:sync/ack` confirms that a snapshot or patch was applied atomically.

Server-to-browser traffic uses nominal `ServerMessage` variants:

- `:snapshot revision store` replaces the local projection and establishes a new baseline.
- `:patch base-revision revision changes` is accepted only when `base-revision` equals the browser revision and every item is a nominal Recollect `change-op`.
- `:effect/pong` keeps transport liveness separate from business data.

服务端只有收到对应 revision 的 ACK 后，才把 `sent-store` 提升为下一次 diff 的 `client-cache`。发送成功不等于客户端已经应用；因此 accepted、backpressured、too-large 和 closed 都是显式的 transport admission 结果。

## Scheduling and failure behavior / 调度与故障行为

- Updater changes request one 16 ms coalesced sync pass; the old 200 ms full-client scan is removed.
- An active client has at most one in-flight projection. Later updates only advance its `dirty-rev`.
- Backpressure schedules a bounded retry and preserves the maximum dirty revision.
- Revision mismatch or an invalid patch leaves the store unchanged and requests a snapshot.
- Hidden tabs become idle; foreground activity or reconnect resumes with a snapshot when required.
- `read-sync-metrics` reports diff latency, UTF-8 patch bytes, patch/snapshot attempts, resync count, pending clients, slow clients, and last revision.

这些规则保证网络发送、应用确认、业务状态三个阶段不会混为一谈。慢客户端只会延迟自己的投影，不会阻塞串行 updater，也不会让服务端把未确认数据误当作 diff 基线。

## 同步状态的类型合同

服务端进程内的 `*client-states` 使用 `Map<Number, ClientSyncState>`。状态中的修订号、
时间戳和布尔字段是具体类型；尚未发送或已确认时，`sent-rev` / `sent-store` 使用
`Option :none`，不再通过缺失 Map 字段或 `-1` 哨兵表示。投影内容仍在明确的
`Map<Tag, Dynamic>` 边界内，状态机本身不再使用无约束的 `C` / `V` 泛型。

只有待确认版本匹配且待确认投影存在时，ACK 才推进缓存。过期、重复以及没有待确认
数据的 ACK 不推进缓存；客户端数量按 Map 条目统计，不能用会去重的 `distinct-values`。
定义附带测试覆盖同值客户端计数、负数 ACK、匹配 ACK、其他客户端隔离，以及既有
accepted/backpressured/too-large/closed 行为。

调度与发送等副作用函数遵守现有 Unit 返回合同：`request-sync!`、
`request-sync-retry!` 不向调用者泄漏定时器句柄，`handle-sync-send!`、`dispatch!`、
`touch-client!` 及 WebSocket 事件回调不返回日志结果或中间集合。函数尾部返回
`&unit`，不吞掉异常，也不改变回调、重试延迟、dirty 标记或 ACK 推进条件。
定时器使用正式 `set-timeout!` 名称；附带测试验证返回值及状态隔离，真实定时器
回放只能使用隔离存储，不能启动针对线上数据的测试服务。

这些状态不写入 `storage.cirru`，传输协议和持久化格式不变。升级此内部表示时需完整
重启原生服务进程，不对仍持有旧 Map 状态的进程直接热重载。

## Persisted state safety / 持久化状态安全

`storage-file` is a concrete `String`; configuration access is explicit so a
typed `Option` can never become a filesystem path. Persistence reads the
nominal `ReelState` database, removes runtime sessions, and writes Cirru EDN.
Never run migration tests against the live file. Use a copy and compare both
bytes and digest before and after the native server lifecycle.

The 2026-08-31 migration used the real 736,198-byte state through load,
WebSocket updates, explicit persistence, and Ctrl-C persistence. The copy and
source both retained SHA-256
`18212a22d8dfdcd9e9f3ecd8cbc7a5fd8975b7644432e4435ea0297a1935b191`.

## Native slow-reader evidence / 原生慢读证据

The raw WebSocket regression used released Calcit 0.13.67, calcit-wss 0.2.25,
and the real state copy:

- initial snapshot: revision 1, 260 bytes;
- 48 KiB router update: revision 2 patch, 98,487 bytes, 53.84 ms observed dispatch-to-frame latency;
- paused socket: 65,536 buffered bytes while 16 resyncs were requested;
- recovery: revision 3 snapshot containing the latest of three updates;
- post-ACK update: patch from base 3 to revision 4, 193 bytes, 52.85 ms observed latency;
- clean close with no server write failure or false disconnect.

The latency numbers include the intentional 16 ms coalescing delay and local
test scheduling, so they are regression evidence rather than a cross-machine
benchmark.
