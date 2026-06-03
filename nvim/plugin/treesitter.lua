vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
      vim.cmd("TSUpdate")
    end
  end,
})

local treesitter = require("nvim-treesitter")
treesitter.setup()
local filetypes = {
  "bash",
  "c",
  "cpp",
  "diff",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "vim",
  "vimdoc",

  "json",
  "javascript",
  "typescript",
  "tsx",
  "yaml",
  "html",
  "css",
  "gitignore",

  "go",
  "gomod",
  "gosum",
  "gotmpl",
  "gowork",
  "templ",

  "python",
  "astro",
  "typst",
  "regex",

  "toml",
  "cmake",
  "make",
}
treesitter.install(filetypes)
vim.api.nvim_create_autocmd("FileType", {
  pattern = filetypes,
  callback = function() vim.treesitter.start() end,
})
