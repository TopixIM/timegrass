# comp-title 可选参数迁移验收

本例对应 [Calcit #1286](https://github.com/calcit-lang/calcit/issues/1286)，只验证
`app.comp.overview/comp-title` 和当前仓库中已解析的调用，不要求整库自动迁移。
业务迁移已在 #101 合并；本次补充可执行的语义证据，不改变生产函数。
验证工具链为 Calcit / `@calcit/procs` 0.22.1。

## 迁移前后

旧定义可在 `git show fee088e^:calcit.cirru` 中查看，核心是：

```cirru.no-check
defcomp comp-title (title child ? on-click)
  div
    {} (:class-name css-title)
      :style $ if (fn? on-click)
        {} $ :cursor :pointer
      :on-click $ fn (e d!)
        when (fn? on-click) (on-click e d!)
        , &unit
    <> title
    =< 16 nil
    , child
```

新定义删除 `?`，`child` 为 `Option<Component>`，`on-click` 为
`Option<Fn(Map<Tag, Dynamic>, Fn(Op) -> Unit) -> Unit>`。事件对象沿用 Respo
的边界类型，不因此扩大业务数据的 Dynamic。当前完整源码和 schema：

```bash
calcit query def app.comp.overview/comp-title
calcit query usages app.comp.overview/comp-title
calcit query def app.comp.overview/comp-overview
```

新函数用 `option:some?` 决定指针样式及回调调用，用 `match child` 展开子组件。
已解析的生产调用均位于 `comp-overview`：Doing 使用 `%some` 子组件、`%none`
回调；Later 使用 `%none` 子组件、`%some` 回调。不要只修改函数而遗漏调用点。

| 旧值/行为 | 本例迁移方式 |
| --- | --- |
| 省略尾部回调 | `%none`；当前尾部 Option 参数也支持省略 |
| 显式 `nil` / `false` 回调 | 旧函数 `fn?` 均为 false，因此映射为 `%none` |
| 函数回调 | `%some handler`，每次点击调用一次 |
| `nil` 子组件 / 实际子组件 | 分别 `%none` / `%some component` |
| 有副作用的参数表达式 | 保留原位置的单次求值，不可直接删除或重复求值 |

`false` 不是通用的 Option 空值：这里只因已阅读旧函数的 `fn?` 判断才可作此
决定。新调用中的裸 `nil`、裸 `false` 和 `%some false` 都应被类型检查拒绝。
其他旧函数可能区分 nil、false 或遗漏，不能照搬本例。

## 为什么本例不启用自动改写

`defcomp` 涉及宏，且旧签名没有完整的类型契约；仅凭可选参数诊断无法证明宏展开、
所有外部消费者以及表达式副作用。已有 fix 候选仍应要求人工审查，不能为了通过
本例而绕过原子校验、revision/fingerprint 或拒绝条件。

人工迁移顺序是：查询定义和 usages → 阅读各调用参数及函数体 → 将空值和函数值
分别改为 `%none` / `%some` → 补充准确 schema → 再查 usages 并执行以下验证。
使用 `calcit tree` / `calcit edit schema` 修改结构化源码，不手工改 snapshot。
如果出现无法解析的外部调用或未知类型，停止自动应用并逐个确认消费者。

## 可重复执行的验收

```bash
yarn check-title-contract
yarn check-client
yarn check-server
yarn compile-page
yarn release-page
```

`comp-title :tests` 中保存五个语义测试，标签为 `:js :title-contract`：省略参数、
显式 None、回调参数只求值一次且每次点击调用一次、子组件只求值一次，以及旧
nil/false 空回调迁移时保留求值且点击无动作。普通方法调用和类型检查仍由编译器处理。

组件依赖 JS 平台样式能力，因此 `check-title-contract.mjs` 为这些 Calcit 测试提供
JS 宿主：复制临时 snapshot，经 CLI 将原始测试 AST 组合为入口，编译并运行，
最后清理临时目录。编译保留正常应用依赖图，但不执行客户端启动函数，也不连接
服务端。语义断言不在 JS 中复制。宿主另外验证三种非法回调实参被类型检查拒绝。
临时 AST 传输使用 CLI 的显式 JSON AST 接口，项目数据格式仍是 Cirru EDN。

该检查已加入 PR CI，不依赖网页手工点击；不能替代整个应用的浏览器验收。
native 的 `check-server` 排除 `:js` 标签，原有 90 个测试仍全部执行；新增的五个
组件测试由 JS 检查负责，避免把宿主不匹配误当成业务失败。
