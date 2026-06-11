---@type vim.lsp.Config
return {
  cmd = { "racket", "--lib", "racket-langserver" },
  filetypes = { "racket", "scheme" },
  root_markers = { ".git" },
  settings = {
    racket = {
      language_families = {
        sexp = { "forge", "forge/temporal" },
      },
    },
  },
}
