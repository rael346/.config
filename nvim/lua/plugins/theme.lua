return {
  {
    'shaunsingh/nord.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.g.nord_italic = false
      vim.g.nord_bold = false

      vim.cmd.colorscheme 'nord'
      -- You can configure highlights by doing something like:
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
}
