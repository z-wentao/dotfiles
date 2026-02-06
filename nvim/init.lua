require("config.lazy")

vim.filetype.add({ filename = { skhdrc = "bash", yabairc = "bash" } })

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8

vim.cmd [[hi @function.builtin guifg=yellow]]

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("n", "<space>pv", ":Vex<CR>")
vim.keymap.set("n", "Y", "mmggyG`m")
-- 缩进与选中优化
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("n", ">", "V>")
vim.keymap.set("n", "<", "V<")

-- v 前缀快捷符号（仅 markdown / txt 文件生效）
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'text' },
  callback = function()
    local o = { buffer = true }
    -- 箭头
    vim.keymap.set("i", "vj", "<Esc>o<space><space><space><C-k>-v<Esc>o<BS>", o)
    vim.keymap.set("i", "vk", "<Esc>o<space><space><space><C-k>!-<Esc>o<BS>", o)
    vim.keymap.set("i", "vl", "<C-k>-><space>", o)
    vim.keymap.set("i", "vh", "<C-k><-", o)
    -- 符号
    vim.keymap.set("i", "vo", "<C-k>OK", o)  -- ✓
    vim.keymap.set("i", "vx", "<C-k>XX", o)  -- ✗
    vim.keymap.set("i", "v.", "<C-k>.M", o)  -- ·
    vim.keymap.set("i", "vc", "```<Esc>O```<Esc>o", o)
    -- 星号标注：在底部生成脚注
    vim.keymap.set("i", "v*", "<C-k>2*<space>", o)
    vim.keymap.set("i", "vv", "<Esc>hea<Esc>byiwi★<Esc>emmGo<CR>★ <Esc>p<Esc>`ma", o)
    vim.keymap.set("v", "vv", "<Esc>hea<Esc>byiwi★<Esc>emmGo<CR>★ <Esc>p<Esc>`m", o)
  end,
})

-- 离开插入模式时自动保存
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*.txt',
  callback = function()
    vim.cmd('silent! write')
  end
})

-- Move lines up and down in visual mode (ThePrimeagen style)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- 快速记事本配置
require('config.quick-notes').setup({
	notes_file = vim.fn.expand("~/Documents/quick-notes.md"),
	window = {
		width = 0.8,
		height = 0.8,
		border = "rounded",
	}
})
