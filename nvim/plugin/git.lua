vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/NeogitOrg/neogit",
  "https://github.com/lewis6991/gitsigns.nvim",
})

require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
})

require("neogit").setup({
  integrations = {
    fzf_lua = true,
    diffview = true,
  },
})
