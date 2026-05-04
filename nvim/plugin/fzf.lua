vim.pack.add({
  "https://github.com/ibhagwan/fzf-lua",
})

require("fzf-lua").setup()

vim.keymap.set("n", "<leader>sh", FzfLua.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", FzfLua.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", FzfLua.files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sm", function()
  FzfLua.marks({ marks = "%l" })
end, { desc = "[S]earch [M]arks" })
vim.keymap.set("n", "<leader>ss", FzfLua.builtin, { desc = "[S]earch [S]elect" })
vim.keymap.set("n", "<leader>sw", FzfLua.grep_cword, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", FzfLua.live_grep_native, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", FzfLua.diagnostics_workspace, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", FzfLua.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set(
  "n",
  "<leader>s.",
  FzfLua.oldfiles,
  { desc = '[S]earch Recent Files ("." for repeat)' }
)
vim.keymap.set("n", "<leader><leader>", FzfLua.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", FzfLua.grep_curbuf, { desc = "[ ] Search current buffers" })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
  FzfLua.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })
