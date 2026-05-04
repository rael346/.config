vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  -- log_level = vim.log.levels.DEBUG,
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- Stop if auto-format is disabled
    if not vim.g.autoformat then return nil end
    return {
      timeout_ms = 500,
    }
  end,
  formatters_by_ft = {
    lua = { "stylua" },

    python = { "ruff_format", "ruff_organize_imports" },

    html = { "prettierd" },
    javascript = { "biome" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    astro = { "biome" },
    json = { "biome" },
    css = { "biome" },
    markdown = { "prettierd" },

    go = { "goimports-reviser", "gofumpt", stop_after_first = false },
    templ = { "templ" },

    c = { "clang-format" },
    cpp = { "clang-format" },
    -- cmake = { "gersemi" },

    typst = { "typstyle" },
    zig = { "zig" },
    bib = { "bibtex-tidy" },
  },
})

-- vim.api.nvim_create_autocmd('BufWritePre', {
--   once = true,
--   callback = function() end,
-- })
--
vim.g.autoformat = true
vim.api.nvim_create_user_command("ToggleFormat", function()
  vim.g.autoformat = not vim.g.autoformat
  vim.notify(
    string.format("%s formatting", vim.g.autoformat and "Enable" or "Disable"),
    vim.log.levels.INFO
  )
end, { desc = "Toggle conform.nvim auto-formatting", nargs = 0 })
