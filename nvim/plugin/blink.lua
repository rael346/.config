vim.pack.add({
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
})

local cmp = require("blink.cmp")
cmp.build():wait(60000)
cmp.setup({
  -- :h blink-cmp-config-keymap
  keymap = { preset = "default" },
  appearance = { nerd_font_variant = "mono" },
  completion = {
    list = {
      -- Insert items while navigating the completion list.
      selection = { preselect = false, auto_insert = true },
      max_items = 10,
    },
    -- documentation = {
    --   auto_show = true,
    -- },
    -- menu = {
    --   auto_show = true,
    -- },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "blink.cmp" and (kind == "update" or kind == "install") then
      vim.system({ "cargo +nightly build --release" })
    end
  end,
})
