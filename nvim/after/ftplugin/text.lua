vim.keymap.set("n", "J", ":m .+1<CR>==")
vim.keymap.set("n", "K", ":m .-2<CR>==")

-- vt: 插入当前时间
vim.keymap.set("i", "vt", function()
  vim.api.nvim_put({os.date("%H:%M")}, 'c', true, true)
end, { desc = "Insert current time" })

