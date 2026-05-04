vim.pack.add({ {
  src = "https://github.com/nvim-mini/mini.nvim",
  version = "stable",
} })

-- Better Around/Inside textobjects
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [']quote
--  - ci'  - [C]hange [I]nside [']quote
require("mini.ai").setup({ n_lines = 500 })

-- Add/delete/replace surroundings (brackets, quotes, etc.)
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require("mini.surround").setup()

require("mini.pairs").setup()

require("mini.comment").setup()
vim.api.nvim_create_autocmd("FileType", {
  pattern = "typst",
  callback = function() vim.bo.commentstring = "// %s" end,
})

require("mini.icons").setup()

local function unique_project_path()
  -- dbj2 hash, see http://www.cse.yorku.ca/~oz/hash.html
  local cwd = vim.fn.getcwd()
  local cwd_hash = 5381
  for i = 1, #cwd do
    cwd_hash = bit.bxor(cwd_hash * 33, cwd:byte(i))
  end

  local project_name = vim.fn.fnamemodify(cwd, ":t")

  local full_path =
    string.format("%s/mini_visits_index/%s_%08x", vim.fn.stdpath("data"), project_name, cwd_hash)
  return full_path
end

require("mini.visits").setup({
  store = {
    autowrite = false,
    path = unique_project_path(),
  },
  track = { event = "" },
})

vim.keymap.set("n", "<leader>a", function()
  MiniVisits.add_label("main")
  MiniVisits.write_index()
end, { desc = "[A]dd label to main" })

vim.keymap.set("n", "<leader>r", function()
  MiniVisits.remove_label("main")
  MiniVisits.write_index()
end, { desc = "[R]emove label from main" })

vim.keymap.set("n", "<leader>m", function()
  -- MiniVisits.select_path("", { filter = "main" })
  -- Get all visits from mini.visits
  FzfLua.fzf_exec(MiniVisits.list_paths("", { filter = "main" }), {
    actions = { ["default"] = FzfLua.actions.file_edit },
    previewer = "builtin",
  })
end, { desc = "[V]isits [P]aths in main" })

local function select(index)
  MiniVisits.iterate_paths("first", nil, { filter = "main", n_times = index })
end

vim.keymap.set("n", "<leader>h", function() select(1) end, { desc = "" })
vim.keymap.set("n", "<leader>j", function() select(2) end, { desc = "" })
vim.keymap.set("n", "<leader>k", function() select(3) end, { desc = "" })
vim.keymap.set("n", "<leader>l", function() select(4) end, { desc = "" })

require("mini.statusline").setup({ use_icons = vim.g.have_nerd_font })

require("mini.files").setup({
  mappings = {
    show_help = "?",
    go_in_plus = "<cr>",
    go_out_plus = "<tab>",
  },
})

vim.keymap.set("n", "-", function()
  local bufname = vim.api.nvim_buf_get_name(0)
  local path = vim.fn.fnamemodify(bufname, ":p")

  -- Noop if the buffer isn't valid.
  if path and vim.uv.fs_stat(path) and not MiniFiles.close() then MiniFiles.open(bufname, false) end
end, { desc = "File Explorer" })
