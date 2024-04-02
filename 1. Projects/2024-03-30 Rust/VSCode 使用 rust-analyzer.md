---
tags: 
cssclass:
source:
created: "2024-03-31 14:55"
updated: "2024-03-31 14:55"
---
前言

Rust 的 VSCode 官方插件体验常常不尽人意，今天逛社区时发现了 rls 2.0 - rust-analyzer， 体验之后我觉得 rust-analyzer 虽然还有不少瑕疵，但至少比 rls 1.0 要好，希望 Rust 工作组 多投入点精力在提升编辑器体验吧: )。

## 安装

2020年7月1日 **更新：**

**经过更新，现在可以直接安装 vscode 商店中的 rust-analyzer 插件， 打开一个 Rust 项目后会自动提示你下载最新的 rust-analyzer ，不需要手动编译。**

需要 nodejs 10+ 和 npm，可以参考 [node.js and npm](https://link.zhihu.com/?target=https%3A//nodejs.org/)，不再赘述。 有可能还需要安装 rust 标准库

```bash
rustup component add rust-src
```

确保 `code` 命令在 `PATH` 环境变量中，并卸载 Rust 插件避免冲突，执行以下命名安装 rust-analyzer

```bash
git clone https://github.com/rust-analyzer/rust-analyzer.git --depth 1 cd rust-analyzer cargo install-ra
```

如果安装没有出错，这将会在机器上安装 rls 和 vscode 插件。

如果要更新 rust-analyzer，pull 最新代码后重跑一次 `cargo install-ra` 即可。

## 配置

打开 VSCode，\[\[ctrl + ,\]\] 搜索 rust 即可看到 rust-analyzer 所有配置。 常用配置有：

```json
{ "rust-analyzer.enableCargoWatchOnStartup": "true", // 打开项目时自动开启 cargo watch "rust-analyzer.highlightingOn": true, // 覆盖内建语法高亮 "rust-analyzer.lruCapacity": 1000, // 分析器最大缓存深度 }
```

更多配置参考 [settings](https://link.zhihu.com/?target=https%3A//github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/README.md%23settings)

## 特性

### workspace 符号查找 \[\[ctrl + t\]\]

除了 VSCode 自带的模糊搜索外，rust-analyzer 还通过 `#` 和 `*` 增强模糊搜索功能。使用快捷键 \[\[ctrl + t\]\] 代开符号搜索，在搜索框输入以下内容，忽略开头的 `#` 号符

- `Foo` 在当前工作区搜索名称为 `Foo` 的类型
- `foo#` 在当前工作区搜索名为 `foo` 的函数
- `Foo*` 在所有**依赖**，包括 `stdlib` 中搜索名称为 `Foo` 的类型
- `foo#**` 在所有依赖中搜索名为 `foo` 的函数

### 当前文档符号搜索 \[\[ctrl + shift + o\]\]

提供了完整的符号搜索能力，详细使用请参考 VSCode 文档。PS: 我最喜欢的一个特性是在 `@` 之后添加 `:` 就可以对所有符号进行分类，整齐又美观。

### 输入辅助

虽然文档中说 rust-analyzer 拥有如下特性，但在我的 VSCode 似乎不起作用 rust-analyzer 会在输入特定字符提供辅助：

- 输入 `let =` 时如果 `=` 跟着一个已知表达式会尝试自动添加 `;`
- 在注释中输入时如果换行会自动在行首添加注释符号
- 在链式调用中输入 `.` 会自动缩进

### 代码辅助

rust-analyzer 添加几个有用的代码提示或辅助。

### 结构体代码辅助

如果把光标移动到结构体名称上，使用 `ctrl + .` 可以看到出现了 `add #[derive]` 和 `add impl` 两个提示，顾名思义 `add #[derive]` 是为结构体添加 `derive` 而 `add impl` 则会自动添加 `impl` 语句块。

### 自动添加缺失 `trait` 成员方法

假如有一个 trait 和 结构体

```rust
trait Foo { fn foo(&self); fn bar(&self); fn baz(&self); } struct S;
```

如果这个结构体要实现这个 trait 你可以在输入 `impl Foo for S {}` 看到左边的辅助提示，按 \[\[ctrl + .\]\] 看到 `add missing impl members`，回车确定后 会自动填充如下代码

```rust
impl Foo for s { fn foo(&self) { unimplemented!() } fn bar(&self) { unimplemented!() } fn baz(&self) { unimplemented!() } }
```

个人觉得这个功能还是非常方便的，特别是实现一些不熟悉的 trait 时不必翻 trait 定义。

### 路径导入

假如有一段这样的代码

```rust
impl std::fmt::Debug for Foo { }
```

光标移动到 `Debug` 后使用代码辅助会帮你如下重构代码

```rust
use std::fmt::Debug; impl Debug for Foo { }
```

### 改变函数可见性

当光标移动到私有函数名时可以通过代码辅助快速地将函数改为 `pub` 或 `pub (crate)`

### 填充模式匹配分支

假设有如下枚举体

```rust
enum A { As, Bs, Cs(String), Ds(String, String), Es{x: usize, y: usize} } fn main() { let a = A::As; match a {} }
```

在输入 `match a {}` 后代码辅助会自动帮你展开匹配，如：

```rust
fn main() { let a = A::As; match <|>a { A::As => (), A::Bs => (), A::Cs(_) => (), A::Ds(_, _) => (), A::Es{x, y} => (), } }
```

也是一个非常实用的功能

除了上述辅助特性，rust-analyzer 还有更多代码辅助特性，有兴趣可以参考 [Code Actions(Assists)](https://link.zhihu.com/?target=https%3A//github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/features.md%23code-actions-assists)

### Magic 填充

这个功能给我的感觉就像使用 IPython 的 `%command` 魔术命令一样，酷炫又实用。 假设有如下函数：

调用函数后跟随 `.if` 接着按 \[\[tab\]\] 会自动展开为 `if foo() {}`。所有可展开表达式如下：

- `expr.if`\->`if expr {}`
- `expr.match`\->`match expr {}`
- `expr.while`\->`while expr {}`
- `expr.ref`\->`&expr`
- `expr.refm`\->`&mut expr`
- `expr.not`\->`!expr`
- `expr.dbg`\->`dbg!(expr)`

除此之外在表达式内还有如下 snippets

- `pd`\->`println!("{:?}")`
- `ppd`\->`println!("{:#?}")`

在模块中还有提供了测试方法的 snippets

- `tfn`\->`#[test] fn f(){}`

## 总结：

新的 rls 比原来的 rls 提供了更多贴心的功能，但一些基本功能反而没有原来的 rls 好，也有可能是缺少 snippets 的原因， 刚开始用还挺不习惯的，但熟悉了只要感觉还是不错。

___

本文参考为 rust-analyzer 文档: [rust-analyzer Github](https://link.zhihu.com/?target=https%3A//github.com/rust-analyzer/rust-analyzer)