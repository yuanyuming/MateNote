---
tags: 
cssclass:
source:
created: "2024-03-31 14:55"
updated: "2024-04-01 15:19"
---
可以关注一下 [Zed](https://link.zhihu.com/?target=https%3A//zed.dev/)，很有潜力的一个 IDE/Editor 项目，目前已经开源。Zed 的一些特点：

- 由 Atom、Electron 和 Tree-sitter 的作者发起
- 使用 Rust 语言开发，充分发挥多核 CPU 的性能
- 团队自研了 GPUI 框架，类似游戏引擎，能够通过 GPU 绘制 UI 界面
- 支持多人实时协作开发（CRDT 数据结构实现）
- 原生支持 Vim 模式
- GPUI 框架暂时只支持 macOS 的 Metal API，跨平台还需要时间

本文主要介绍如何使用 VSCode + Rust-Analyzer 配置 Rust 开发环境。

## 0 前言

自从微软推出了 [LSP 语言服务协议（Language Server Protocol）](https://link.zhihu.com/?target=https%3A//microsoft.github.io/language-server-protocol/)，每种编程语言只需实现一个 Language Server 后端，就可以为任何支持 LSP 协议的 IDE/Editor 提供代码高亮、自动补全、导航重构等功能，而不必为每一个 IDE/Editor 重复实现上述功能。实际上，LSP 和 DAP 正在让 IDE 和代码编辑器的界限越发模糊。

截止到 2022 年，开源社区已经涌现出一大批优秀的 Language Server 实现，它们在各自领域已经拥有了接近甚至超越商业闭源 IDE 的功能：

- [Rust-Analyzer(Rust)](https://link.zhihu.com/?target=https%3A//rust-analyzer.github.io/manual.html)
- [Clangd(C/C++)](https://link.zhihu.com/?target=https%3A//clangd.llvm.org/)
- [Haskell-Language-Server(Haskell)](https://link.zhihu.com/?target=https%3A//haskell-language-server.readthedocs.io/en/latest/)
- Pylance(Python)
- Gopls(Go)
- TexLab(LaTeX)

关于更多 Language Server 实现：

目前支持 LSP 协议的 IDE/Editor：

- **Visual Studio Code**
- **Clion(没错，Jetbrains 开发的 Clion 使用了 clangd LSP)**
- Neovim
- Sublime Text
- Fleet

`rustup`是 Rust 的安装程序，也是它的版本管理工具，rust 官方推荐使用`rustup`来安装 Rust 工具链（包括 `cargo`、`rustc`）

### Windows

Windows 中 rustc 依赖于 [Microsoft C++ Build Tools](https://link.zhihu.com/?target=https%3A//visualstudio.microsoft.com/zh-hans/visual-cpp-build-tools/)(也就是微软的 MSVC 编译器)，在网站中点击`下载生成工具`，下载安装后在打开的面板内选择`使用 C++ 的桌面开(Desktop development with c++)` 即可

![](https://pic3.zhimg.com/v2-b2c9543945671c8e68591d0443a8cdea_b.jpg)

![](https://pic4.zhimg.com/v2-dceefa7c44dd7ea026e3357f365d6417_b.jpg)

通过包管理器 [Scoop](https://link.zhihu.com/?target=https%3A//scoop.sh/%23/) 安装 `rustup`（自动添加环境变量，需要良好的网络环境）：

```powershell
# 首先安装 git scoop install git # 安装 rustup scoop install main/rustup # 安装稳定版 (stable) 工具链，或换成开发版 (nightly) rustup default stable
```

不想用包管理器，可以在 [https://www.rust-lang.org/zh-CN/learn/get-started](https://link.zhihu.com/?target=https%3A//www.rust-lang.org/zh-CN/learn/get-started) 中下载`rustup-init.exe(64位)`或`(32位)`并安装

```text
PS C:\Users\Hehongyuan> rustup-init.exe ...... Current installation options: default host triple: x86_64-pc-windows-msvc default toolchain: stable (default) profile: default modify PATH variable: yes 1) Proceed with installation (default) 2) Customize installation 3) Cancel installation
```

注意，这种安装方式可能需要添加

`%Visual Studio 安装位置%\VC\Tools\MSVC\%version%\bin\Hostx64\x64`到 PATH 环境变量中（请自行替换其中的 `%Visual Studio 安装位置%`、`%version%` 字段），或者直接在`Developer PowerShell for Visual Studio`终端中运行`rustup-init.exe`（如图所示）

![](https://pic1.zhimg.com/v2-47c5a978d8d07b9141c64e9a2c20d8e8_b.jpg)

### OS X

使用包管理器 Homebrew 安装 `rustup`：

```bash
# 安装 rustup brew install rustup # 安装稳定版 (stable) 工具链，或换成开发版 (nightly) rustup default stable
```

或者通过以下命令安装：

```bash
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```

如果遇到了提示链接器无法执行的情况，安装 `libc` 和链接器 `linker`：

### Linux & WSL

通过包管理器安装（以 Arch 为例）：

```text
# 安装 rustup sudo pacman -Syu rustup # 安装稳定版 (stable) 工具链，或换成开发版 (nightly) rustup default stable
```

或在终端直接运行以下命令：

```bash
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```

如果遇到了提示链接器无法执行的错误，建议通过包管理器安装 `libc` 和链接器 `linker`

### 检查安装是否成功

检查是否正确安装了 Rust，可打开终端并输入下面这行，此时能看到最新发布的稳定版本的版本号、提交哈希值和提交日期：

```text
$ rustc -V rustc 1.56.1 (59eed8a2a 2021-11-01) $ cargo -V cargo 1.57.0 (b2e52d7ca 2021-10-21)
```

如果没看到此信息：

1. 如果你使用的是 Windows，请检查 Rust 或 %USERPROFILE%\\.cargo\\bin 是否在 %PATH% 系统变量中。
2. 如果你使用的是 WSL，请关闭并重新打开终端，再次执行以上命令。

## 2 VSCode 插件推荐和配置

### 插件推荐

安装 Visual Studio Code 后，安装如下拓展：

- **`Rust-Analyzer`**
- **`CodeLLDB`**
- `Catppuccin Noctis` （我个人非常喜欢的一款主题）
- `crates`
- `Error Lens`（更直观的错误提示）
- `Even Better TOML`，支持 .toml 文件完整特性
- `Project Manager`(收藏、识别和管理你的工作空间和项目文件夹)
- `Vim`（Vim 模拟器，不知道 vim 是什么不要安装）
- `GitLens`（Git插件，可选）
- `GitHub Copilot`（Github 开发的代码智能提示插件，不建议初学者使用）

> 在搜索 VSCode 插件时，报错：`提取扩展出错，XHR failed`，这个报错是因为网络原因导致，很可能是你的网络不行或者翻墙工具阻拦你的访问，试着关掉翻墙，再进行尝试。

### Vim 插件的使用 ⚠

在启动 VSCode 的时候，可能遇到 XXX 扩展正在加载的 bug，解决方案：

### `settings.json` ⚠

通过 `F1` 或 `ctrl/command+shift+p` 快捷键打开 VSC 的命令面板（Command Palette），然后输入并执行 `Preferences: Open User Settings (JSON)` 即可打开名为 `setting.json` 的设置文件。笔者倾向于将尽可能多的设置放在 `settings.json` 中，以便于用 Github 账号进行同步。下面贴出笔者的个人配置及说明，你可以**有选择地粘贴**到自己的 `settings.json` 中。

- 请认真读一遍注释
- vim 插件的配置和使用参加 [Sirius：VSCode 使用 Vim 插件的最佳实践](https://zhuanlan.zhihu.com/p/648918909)
- 除全局 `settings.json` 外，这些配置也可以粘贴到项目文件夹中的 `.vscode/settings.json` 中，这样只对该项目生效，且优先级高于全局设置

```json
{ // [[Terminal]] "terminal.integrated.fontSize": 14, // 集成终端字号 "terminal.integrated.tabs.showActions": "always", // 始终显示“新建终端”按钮旁的“终端拆分”和“终止”按钮 "terminal.integrated.tabs.showActiveTerminal": "always", // 始终显示活动终端 "terminal.integrated.enableBell": true, // 集成终端启用视觉化铃声 "terminal.integrated.gpuAcceleration": "on", // 集成终端使用GPU加速 "terminal.integrated.rightClickBehavior": "selectWord", // 集成终端右击时选择光标下方的字词，并打开上下文菜单 "terminal.integrated.defaultProfile.windows": "PowerShell", "terminal.integrated.env.windows": { "LC_ALL": "zh_CN.UTF-8" // 集成终端编码: zh_CN.UTF-8 }, // [[Git]] "git.autofetch": true, // 自动从当前 Git 存储库的默认远程库提取提交 "git.confirmSync": false, // 同步 Git 存储库前确认 "git.enableSmartCommit": true, // 没有暂存的更改时，直接提交全部 "git.mergeEditor": true, // 启用三向合并编辑器 "gitlens.defaultDateLocale": null, "gitlens.defaultDateFormat": null, "gitlens.defaultDateShortFormat": null, // [[Vim]] "vim.easymotion": true, "vim.incsearch": true, "vim.useSystemClipboard": true, "vim.useCtrlKeys": true, "vim.hlsearch": true, "vim.insertModeKeyBindings": [ { "before": [ "j", "j" ], "after": [ "<Esc>" ] } ], "vim.normalModeKeyBindingsNonRecursive": [ { "before": [ "<leader>", "d" ], "after": [ "d", "d" ] }, { "before": [ "<C-n>" ], "commands": [ ":nohl" ] }, { "before": [ "K" ], "commands": [ "lineBreakInsert" ], "silent": true }, { // g + d open definition in side view "before": [ "g", "d" ], "commands": [ "editor.action.revealDefinitionAside" ] }, { // g + i open implementation in side view "before": [ "g", "i" ], "commands": [ "workbench.action.splitEditor", "editor.action.goToImplementation" ] }, { // g + t open type definition in side view "before": [ "g", "t" ], "commands": [ "workbench.action.splitEditor", "editor.action.goToTypeDefinition" ] }, { // rename symbol "before": [ "r", "n" ], "commands": [ "editor.action.rename" ] }, { // format document "before": [ "f", "f" ], "commands": [ "editor.action.formatDocument" ] }, { // open current tab in new side view "before": [ "s", "n" ], "after": [ "<C-w>", "v" ] }, { // close current tab "before": [ "s", "c" ], "after": [ "<C-w>", "c" ] }, { // switch to the left tab "before": [ "s", "h" ], "after": [ "g", "T" ] }, { // switch to the right tab "before": [ "s", "l" ], "after": [ "g", "t" ] }, { // switch between editor groups/views "before": [ "s", "s" ], "commands": [ "workbench.action.navigateEditorGroups" ] }, { // start the zen mode "before": [ "z", "z" ], "commands": [ "workbench.action.toggleZenMode" ] } ], "vim.leader": "<space>", "vim.handleKeys": { "<C-a>": false, "<C-f>": false, "<C-c>": false, "<C-b>": false, "<C-0>": false }, // [[General]] "breadcrumbs.filePath": "on", // 控制是否及如何在“导航路径”视图中显示文件路径 // window "window.commandCenter": true, "window.restoreWindows": "all", "window.titleBarStyle": "native", "window.menuBarVisibility": "hidden", // editor "editor.minimap.renderCharacters": false, "explorer.compactFolders": false, // 资源管理器不采用紧凑模式 "editor.fontFamily": "JetBrains Mono, LXGW Bright", // 编辑器全局字体 "editor.fontLigatures": true, // 启用连字体 "editor.fontSize": 15, // 字号 "editor.lineHeight": 0, // 行高：使用 0 根据字号自动计算行高 "editor.bracketPairColorization.enabled": true, // 控制是否对括号着色 "editor.bracketPairColorization.independentColorPoolPerBracketType": false, // 各类括号着色等级不独立 "editor.guides.bracketPairs": true, // 启用括号指导线 "editor.guides.bracketPairsHorizontal": "active", // 启用水平括号指导线 "editor.guides.highlightActiveIndentation": false, // 禁用高亮选中的缩进指导线 "editor.guides.indentation": false, // 禁用缩进指导线 "editor.semanticHighlighting.enabled": true, // 颜色主题 // workbench "workbench.startupEditor": "none", // 在没有从上一个会话恢复出信息的情况下，在启动时不打开编辑器 "workbench.iconTheme": "gruvbox-material-icon-theme", "workbench.colorTheme": "Catppuccin Noctis", "workbench.view.alwaysShowHeaderActions": true, // 显示视图头部的操作项 "workbench.settings.editor": "json", // 默认打开 settings.json 进行设置 "workbench.editor.historyBasedLanguageDetection": true, // 允许语言检测使用编辑器历史记录 // debug "debug.console.acceptSuggestionOnEnter": "on", // 调试控制台中可以用 enter 接受建议 "debug.internalConsoleOptions": "neverOpen", // 从不自动打开内部调试控制台 // editor "editor.acceptSuggestionOnEnter": "on", // 编辑器中可以用 enter 接受建议 "editor.stickyScroll.enabled": true, // 启用粘滞滚动，即显示上一级对应的代码 "editor.wordBasedSuggestionsMode": "allDocuments", // 建议所有打开文档中的字词 "editor.unicodeHighlight.ambiguousCharacters": false, // 不突出显示可能与基本 ASCII 字符混淆的字符 "editor.inlayHints.enabled": "on", // 在编辑器中显示内联提示 "editor.minimap.enabled": true, // 控制是否显示缩略图cod "editor.formatOnType": true, // 自动格式化 "editor.renderWhitespace": "none", // 控制编辑器在空白字符上显示符号的方式 "editor.snippetSuggestions": "top", // 代码片段建议置于其他建议之上 "editor.stickyTabStops": true, // 使用空格缩进时模拟制表符的行为，可以方便对齐 "editor.tabSize": 4, // 一个制表符 = 4个空格 "editor.suggest.insertMode": "replace", // 建议的接受方式 "editor.suggest.localityBonus": true, // 控制排序时是否提高靠近光标的词语的优先级 "editor.suggest.matchOnWordStartOnly": false, // 禁用建议必须匹配开头 "editor.suggest.shareSuggestSelections": true, "editor.suggest.showStatusBar": true, // 控制建议小部件底部的状态栏可见 "editor.suggestOnTriggerCharacters": true, // 控制在键入触发字符后是否自动显示建议 "editor.suggestSelection": "first", // 始终预先选择第一个建议 "editor.wordBasedSuggestions": true, // 控制是否根据文档中的文字提供建议列表 "editor.autoClosingOvertype": "always", // 控制编辑器应当自动改写左引号或右引号 "editor.detectIndentation": false, // 禁用自动检测文件缩进模式和缩进大小，即打开文件后自动将文件更改为 VSCode 配置的缩进格式 "editor.formatOnSave": true, // 保存自动格式化代码 "editor.formatOnPaste": true, // 粘贴自动格式化 "editor.quickSuggestionsDelay": 0, // 控制显示快速建议前的等待时间（毫秒） "editor.inlineSuggest.enabled": true, // 在编辑器中自动显示内联建议 "editor.parameterHints.enabled": true, // 是否在输入时显示含有参数文档和类型信息的小面板 // 控制是否在键入代码时自动显示建议 "editor.quickSuggestions": { "comments": false, // 键入注释时不允许 "other": true, // 键入其他时允许 "strings": false // 键入字符串时不允许 }, // explorer "explorer.confirmDragAndDrop": false, // 移动文件时无需确认 "explorer.confirmDelete": false, // 删除文件确认 "explorer.incrementalNaming": "smart", // 粘贴同名文件时的重命名方式;smart: 在重复名称末尾智能地添加/递增数字 // files "files.autoSave": "afterDelay", // 自动保存 "files.hotExit": "onExitAndWindowClose", // 在会话间记住未保存的文件,允许在退出编辑器时跳过保存提示 onExitAndWindowClose: 退出或窗口关闭时 // notebook "notebook.lineNumbers": "on", // 控制单元格编辑器中行号的显示 // 应该在何处显示单元格工具栏，或是否隐藏它 "notebook.cellToolbarLocation": { "default": "right", // 默认: 右边 "jupyter-notebook": "left" // jupyter-notebook: 左边 }, // search "search.showLineNumbers": true, // 显示搜索结果所在行号 "search.smartCase": true, // 当搜索词为小写时，则不区分大小写进行搜索，否则区分大小写 // 配置在搜索中排除的文件和文件夹的glob模式 "search.exclude": { // "someFolder/": true, // "somefile": true }, // output "output.smartScroll.enabled": true, // 输出窗口智能滚动：点击时锁定，点击最后一行时解锁 // problems "problems.showCurrentInStatus": true, // 在状态栏显示当前问题 "problems.sortOrder": "position", // 控制问题导航的显示顺序 "json.schemaDownload.enable": true, "security.workspace.trust.untrustedFiles": "open", "extensions.ignoreRecommendations": true, "http.proxySupport": "on", // [[LLDB]] "lldb.commandCompletions": true, // LLDB 指令自动补全 "lldb.dereferencePointers": true, // LLDB 指针显示解引用内容 "lldb.evaluateForHovers": true, // LLDB 鼠标悬停在变量上时预览变量值 "lldb.launch.expressions": "native", // LLDB 监视表达式的默认类型 "lldb.showDisassembly": "never", // LLDB 不显示汇编代码 "lldb.verboseLogging": true, // [[Python]] "[python]": { "editor.defaultFormatter": "ms-python.black-formatter" }, "python.venvPath": "~/Code/python/pyvenvs", // Python 虚拟环境所在路径 "python.analysis.typeCheckingMode": "basic", // [[Haskell]] "haskell.ghcupExecutablePath": "C:/ghcup/bin/ghcup.exe", "haskell.manageHLS": "GHCup", }
```

### `keybingdings.json` 设置

```text
// Place your key bindings in this file to override the defaults [ { "key": "j", "command": "selectNextSuggestion", "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus" }, { "key": "k", "command": "selectPrevSuggestion", "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus" }, { "key": "u", "command": "undo", "when": "vim.mode == 'Normal'" }, { "key": "/", "command": "hideSuggestWidget", "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus" }, { "key": "ctrl+r", "command": "rust-analyzer.run", "when": "editorLangId == rust" }, { "key": "ctrl+r", "command": "python.execInDedicatedTerminal", "when": "editorLangId == python" }, { "key": "ctrl+r", "command": "xmake.onBuildRun", "when": "editorLangId == cpp" }, ]
```

## 3 Rustup

请注意，如果你通过包管理器安装 rustup，它的更新和卸载会被包管理器接管，以下命令应该不起作用。

要更新 Rust，在终端执行以下命令即可更新：

要卸载 Rust 和 rustup，在终端执行以下命令即可卸载：

更多命令：

```text
PS C:\Users\Sirius> rustup rustup 1.26.0 (5af9b9484 2023-04-05) The Rust toolchain installer USAGE: rustup.exe [OPTIONS] [+toolchain] <SUBCOMMAND> ARGS: <+toolchain> release channel (e.g. +stable) or custom toolchain to set override OPTIONS: -v, --verbose Enable verbose output -q, --quiet Disable progress output -h, --help Print help information -V, --version Print version information SUBCOMMANDS: show Show the active and installed toolchains or profiles update Update Rust toolchains and rustup check Check for updates to Rust toolchains and rustup default Set the default toolchain toolchain Modify or query the installed toolchains target Modify a toolchain's supported targets component Modify a toolchain's installed components override Modify directory toolchain overrides run Run a command with an environment configured for a given toolchain which Display which binary will be run for a given command doc Open the documentation for the current toolchain self Modify the rustup installation set Alter rustup settings completions Generate tab-completion scripts for your shell help Print this message or the help of the given subcommand(s) DISCUSSION: Rustup installs The Rust Programming Language from the official release channels, enabling you to easily switch between stable, beta, and nightly compilers and keep them updated. It makes cross-compiling simpler with binary builds of the standard library for common platforms. If you are new to Rust consider running `rustup doc --book` to learn Rust.
```

## 4 Cargo

`Cargo` 的使用见：

如果发现 `cargo` 下载依赖太慢，大概率是网络问题。

注意，代理工具默认开启的仅仅是一些 GUI 软件的代理，对于命令行或者软件中的访问，并不会代理流量，因此这些访问还是通过正常网络进行的，自然会失败。

因此，大家需要做的是在你使用的代理工具中 `复制终端代理命令` 或者开启全局代理。由于每个翻墙软件的使用方式不同，因此具体的还是需要自己研究下。以 `Clash for Windows` 为例，需要先点击 `TAP Device`，然后点击 `Service Mode`，最后开启 `TUN Mode`，大致就可以了。Linux 的代理工具推荐使用 V2raya，详见：

关于如何添加镜像源的问题：

## 5 Rust-Analyzer 

## 6 Rust 学习资料推荐

### 入门

### 进阶

## 7 值得关注的 Rust 项目

Zed：由 Atom 和 tree-sitter 作者发起，高性能、高颜值、支持多人在线协同开发的下一代 IDE。为了实现极致的性能，团队自研了名为 GPUI 的 UI 框架，利用 GPU 绘制图形界面（因为 GPUI 框架暂时只支持 macOS 的 Metal，Windows 和 Linux 跨平台还需要时间）：

![](https://pic3.zhimg.com/v2-09155c6712612c9ac0d1e9f1b811a3fa_b.jpg)

Candle：Hugging Face 开源的机器学习框架：

Deno：Node.js 之父开发的下一代 JavaScript 运行时：

Tauri：跨平台、更节省内存、类似 Electron 的 Rust GUI 框架：

Typst：支持增量编译、实时预览的排版系统、LaTeX 替代品：

TiKV：PingCAP TiDB 的基础组件：