-- Install with
-- mac: brew install lua-language-server
-- Arch: pacman -S lua-language-server

---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".stylua.toml",
    "init.lua",
  },
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
        -- library = vim.api.nvim_get_runtime_file("", true),
        -- library = {
        --   vim.env.VIMRUNTIME,
        -- },
        library = vim.tbl_filter(
          function(d) return not d:match(vim.fn.stdpath("config") .. "/?a?f?t?e?r?") end,
          vim.api.nvim_get_runtime_file("", true)
        ),
      },
      completion = { callSnippet = "Replace" },
      -- Using stylua for formatting.
      format = { enable = false },
      hint = {
        enable = true,
        arrayIndex = "Disable",
      },
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
    },
  },
}
