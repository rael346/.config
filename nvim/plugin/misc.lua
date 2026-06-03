vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/nvim-lua/plenary.nvim",
      "https://github.com/folke/todo-comments.nvim",
      "https://github.com/folke/which-key.nvim",
    })
    require("todo-comments").setup()
    require("which-key").setup()
  end,
})

vim.pack.add({
  "https://github.com/mrjones2014/smart-splits.nvim",
  "https://github.com/chomosuke/typst-preview.nvim",
})
local smart_split = require("smart-splits")
smart_split.setup()
vim.keymap.set("n", "<C-h>", smart_split.move_cursor_left)
vim.keymap.set("n", "<C-j>", smart_split.move_cursor_down)
vim.keymap.set("n", "<C-k>", smart_split.move_cursor_up)
vim.keymap.set("n", "<C-l>", smart_split.move_cursor_right)

require("typst-preview").setup({
  tinymist = "/opt/homebrew/bin/tinymist",
})

-- vim.pack.add({
--   "https://github.com/sphamba/smear-cursor.nvim",
--   "https://github.com/karb94/neoscroll.nvim",
-- })
-- require("smear_cursor").setup({
--   stiffness = 0.5,
--   trailing_stiffness = 0.5,
--   matrix_pixel_threshold = 0.5,
-- })
-- require("neoscroll").setup({
--   duration_multiplier = 0.3,
-- })
