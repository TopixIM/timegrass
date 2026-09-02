# Use released respo-markdown 0.4.29

Timegrass CI showed that the root still requested respo-markdown 0.4.28 while
0.4.29 was already published and selected transitively by alerts and feather.
Pin the root to 0.4.29 so this mismatch is not carried into the remaining
strict dependency release chain.

Timegrass CI 显示根项目仍请求 respo-markdown 0.4.28，而 alerts 与 feather
已传递选择正式发布的 0.4.29。将根依赖同步到 0.4.29，避免把这一项版本分裂
继续带入剩余的 strict dependency 发布链。
