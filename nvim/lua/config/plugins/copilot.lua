return {
  "github/copilot.vim",
  config = function()
    -- 禁用默认的 Tab 映射
    vim.g.copilot_no_tab_map = true

    -- 使用 Ctrl+J 接受 Copilot 建议（官方推荐）
    vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      silent = true,
    })

    -- 可选：其他 Copilot 快捷键
    vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)")      -- 下一个建议 (Option+])
    vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)")  -- 上一个建议 (Option+[)
    -- 取消建议不需要单独映射，继续输入或按 Esc 自然会消失
  end,
}
