# dotfiles

macOS 上用 yabai 做窗口管理的一套配置。从 BetterTouchTool 迁移到了 skhd，所有快捷键都是 Option 系的。

日常工作流大概是这样：Option+数字切空间，hjkl 移焦点，Option+n 弹个浮动窗口随手记点东西，写完 Esc 两下就关了。笔记存在 iA Writer 的 iCloud 目录里，手机上也能看。

---

### yabai

窗口管理器。BSP 布局，窗口自动平铺。鼠标跟随焦点（autoraise），fn 键拖拽移动/缩放窗口。

有个外接显示器适配逻辑——检测 UUID 判断是不是 iPad Sidecar，给外接屏的空间加上 SketchyBar 的顶部边距。

几个 app 有固定位置：iA Writer 在 1，Safari 在 3，Claude 在 8。iStat、Spotlight 这些浮动不管。

终端聚焦时自动切英文输入法，用的是系统自带的 Swift Carbon API，不需要额外装东西。

### skhd

所有键盘快捷键都在这里，替代了之前的 BetterTouchTool。

核心思路是 Option 做主修饰键，Shift+Option 做"加强版"：
- `alt + hjkl` 聚焦窗口，`shift+alt + hl` 调大小
- `alt + 数字` 切空间，`shift+alt + 数字` 把窗口扔过去
- `alt+n` 弹出 QuickNote 浮动窗口写日记
- `alt+return` 开 iTerm，`shift+alt+return` 全屏
- `shift+alt+m` 切换深色模式

### alacritty

只用来做 QuickNote 的浮动终端。字体 20，无边框，yabai 规则里标记为 manage=off + sticky，不参与平铺。

### nvim

基于 lazy.nvim 的配置。Treesitter、Telescope、LSP、Copilot 这些常规的都有。

比较特别的是一套 markdown 里的快捷输入：`vj` 打下箭头，`vo` 打勾，`vx` 打叉，`vv` 给当前词加星号脚注。InsertLeave 自动保存 txt 文件。

有个 quick-notes 浮动窗口模块，`<leader>n` 在 nvim 内部弹出来记东西。

### sketchybar

顶部状态栏。Tokyo Night 配色。左边是空间指示器（点击可切换），右边是时间、电池、输入法。

输入法指示器有个自己写的 Swift 监听器，能实时反映切换状态。

### tmux

Prefix 改成了 `C-a`。vim 风格的 pane 导航和 copy mode。

外观是 Kanagawa 配色——深蓝底、蓝色活跃标签、粉色当前窗口。用了 sessionx 插件做会话切换。

### sioyek

PDF 阅读器配置。定义了 A-Z 全套 26 种高亮颜色，阅读论文的时候用不同颜色标注不同类型的内容。
