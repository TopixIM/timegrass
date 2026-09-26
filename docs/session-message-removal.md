# Session 通知删除边界

本步骤只收紧通知删除操作，不宣称数据库已完成 Struct 迁移。

- UI 库回调提供旧格式消息信息。客户端经过 `decode-operation` 验证后才 dispatch。
- 网络边界接受字符串 ID 和旧客户端的 `{:id String}` Map；缺失、nil、数字 ID 均返回解码错误。
- 内部 `Op :session/remove-message` 和 updater 参数统一为 String；updater 不再从任意数据读取 ID。
- 只删除指定 session 的目标消息，保留其他消息及其他 session。不存在的 session 应保持数据库不变，避免迟到操作重建已断开的 session。
- 用 Calcit definition tests 覆盖新旧网络格式、序列化往返、无效输入及跨 session 隔离；完成后运行双入口严格检查和 JS 构建。
