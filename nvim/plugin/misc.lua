vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/nvim-lua/plenary.nvim",
      "https://github.com/folke/todo-comments.nvim",
      "https://github.com/folke/which-key.nvim",
    })
    -- require("plenary").setup()
    require("todo-comments").setup()
    require("which-key").setup()
  end,
})

vim.pack.add({
  "https://github.com/mrjones2014/smart-splits.nvim",
})

local smart_split = require("smart-splits")
smart_split.setup()

vim.keymap.set("n", "<C-h>", smart_split.move_cursor_left)
vim.keymap.set("n", "<C-j>", smart_split.move_cursor_down)
vim.keymap.set("n", "<C-k>", smart_split.move_cursor_up)
vim.keymap.set("n", "<C-l>", smart_split.move_cursor_right)
