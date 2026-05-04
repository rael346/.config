local options = {
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  diff = { mode = "bg" }, -- [bg|fg]
  search = { theme = "vim" }, -- [vim|vscode]
  borders = true,
  errors = { mode = "bg" }, -- [bg|fg|none]
  -- Value is any valid attr-list value for `:help nvim_set_hl`
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
    errors = {},

    -- To customize lualine/bufferline
    bufferline = {
      current = {},
      modified = { italic = true },
    },
  },
  colorblind = {
    enable = false,
    preserve_background = false,
    severity = {
      protan = 0,
      deutan = 0,
      tritan = 0,
    },
  },
  -- You can override colors
  on_colors = function(colors) end,

  -- You can override specific highlights to use other groups or a hex color
  on_highlights = function(highlights, colors) end,
}

-- Reset highlighting.
vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then vim.cmd.syntax("reset") end

vim.o.termguicolors = true
vim.g.colors_name = "nord-simple"

-- token from https://www.nordtheme.com/docs/colors-and-palettes
local c = {
  polar_night = {
    origin = "#2E3440", -- nord0
    bright = "#3B4252", -- nord1
    brighter = "#434C5E", -- nord2
    brightest = "#4C566A", -- nord3
    light = "#616E88", -- out of palette
  },
  snow_storm = {
    origin = "#D8DEE9", -- nord4
    brighter = "#E5E9F0", -- nord5
    brightest = "#ECEFF4", -- nord6
  },
  frost = {
    polar_water = "#8FBCBB", -- nord7
    ice = "#88C0D0", -- nord8
    artic_water = "#81A1C1", -- nord9
    artic_ocean = "#5E81AC", -- nord10
  },
  aurora = {
    red = "#BF616A", -- nord11
    orange = "#D08770", -- nord12
    yellow = "#EBCB8B", -- nord13
    green = "#A3BE8C", -- nord14
    purple = "#B48EAD", -- nord15
  },
  none = "NONE",
}

local function make_global_bg(transparent)
  if options.transparent and transparent then return c.none end

  return c.polar_night.origin
end
local global_bg = make_global_bg()

-- dark
vim.g.terminal_color_0 = c.polar_night.bright
vim.g.terminal_color_8 = c.polar_night.brightest

-- light
vim.g.terminal_color_7 = c.snow_storm.brighter
vim.g.terminal_color_15 = c.snow_storm.brightest

-- colors
vim.g.terminal_color_1 = c.aurora.red
vim.g.terminal_color_9 = c.aurora.red

vim.g.terminal_color_2 = c.aurora.green
vim.g.terminal_color_10 = c.aurora.green

vim.g.terminal_color_3 = c.aurora.yellow
vim.g.terminal_color_11 = c.aurora.yellow

vim.g.terminal_color_4 = c.frost.artic_water
vim.g.terminal_color_12 = c.frost.artic_water

vim.g.terminal_color_5 = c.aurora.purple
vim.g.terminal_color_13 = c.aurora.purple

vim.g.terminal_color_6 = c.frost.ice
vim.g.terminal_color_14 = c.frost.polar_water

-- bg and fg
vim.g.terminal_color_background = c.polar_night.origin
vim.g.terminal_color_foreground = c.snow_storm.origin

local group_basic = {
  ColorColumn = { bg = c.polar_night.bright },
  Conceal = { fg = c.none, bg = c.none },
  Cursor = { fg = c.snow_storm.origin, bg = c.none, reverse = true },
  CursorIM = { fg = c.snow_storm.brighter, bg = c.none, reverse = true },
  CursorColumn = { bg = c.polar_night.bright },
  CursorLine = { bg = c.polar_night.bright },
  Directory = { fg = c.frost.ice },
  EndOfBuffer = { fg = c.polar_night.bright },
  ErrorMsg = { fg = c.snow_storm.origin, bg = c.aurora.red },
  VertSplit = { fg = options.borders and c.polar_night.bright or c.polar_night.origin, bg = c.none },
  WinSeparator = {
    fg = options.borders and c.polar_night.bright or c.polar_night.origin,
    bg = c.none,
  },
  Folded = { fg = c.snow_storm.brightest, bg = c.polar_night.bright },
  FoldColumn = { fg = c.polar_night.brightest, bg = global_bg },
  SignColumn = { fg = c.polar_night.bright, bg = make_global_bg(true) },
  Substitute = { link = "Search" },
  LineNr = { fg = c.polar_night.brightest, bg = c.none },
  CursorLineNr = { fg = c.snow_storm.origin, bold = true },
  MatchParen = { bg = c.polar_night.brightest, bold = true },
  ModeMsg = { fg = c.snow_storm.origin },
  MsgArea = {},
  MsgSeparator = {},
  MoreMsg = { fg = c.frost.ice },
  NonText = { fg = c.polar_night.brighter },
  Normal = { fg = c.snow_storm.origin, bg = make_global_bg(true) },
  NormalFloat = { fg = c.snow_storm.origin, bg = global_bg },
  FloatBorder = { fg = c.polar_night.brightest, bg = global_bg },
  Pmenu = { fg = c.snow_storm.origin, bg = c.polar_night.bright },
  PmenuSel = { fg = c.snow_storm.origin, bg = c.polar_night.brighter },
  PmenuSbar = { fg = c.snow_storm.origin, bg = c.polar_night.brighter },
  PmenuThumb = { fg = c.frost.ice, bg = c.polar_night.brightest },
  Question = { fg = c.snow_storm.origin },
  QuickFixLine = { fg = c.snow_storm.origin, bg = c.none, reverse = true },
  Search = options.search.theme == "vscode"
      and { fg = c.none, bg = utils.darken(c.frost.ice, 0.2) }
    or { fg = c.frost.ice, bg = c.none, reverse = true },
  IncSearch = options.search.theme == "vscode"
      and { fg = c.snow_storm.origin, bg = utils.darken(c.frost.ice, 0.5) }
    or { fg = c.snow_storm.brightest, bg = c.frost.ice },
  CurSearch = { link = "IncSearch" },
  SpecialKey = { fg = c.polar_night.brightest },
  SpellBad = { sp = c.aurora.red, undercurl = true },
  SpellCap = { sp = c.aurora.yellow, undercurl = true },
  SpellLocal = { sp = c.snow_storm.brighter, undercurl = true },
  SpellRare = {
    fg = c.snow_storm.brightest,
    bg = global_bg,
    sp = c.snow_storm.brightest,
    undercurl = true,
  },
  StatusLine = { fg = c.frost.ice, bg = c.polar_night.brighter },
  StatusLineNC = { fg = c.snow_storm.origin, bg = c.polar_night.brightest },
  TabLine = { fg = c.snow_storm.origin, bg = c.fg_gutter },
  TabLineFill = { fg = c.snow_storm.origin, bg = c.polar_night.bright },
  TabLineSel = { fg = c.frost.ice, bg = c.polar_night.brightest },
  Title = { fg = c.snow_storm.origin, bold = true },
  Visual = { fg = c.none, bg = c.polar_night.brighter },
  VisualNOS = { fg = c.none, bg = c.polar_night.brighter },
  WarningMsg = { fg = c.polar_night.origin, bg = c.aurora.yellow },
  Whitespace = { fg = c.polar_night.brighter },
  WildMenu = { fg = c.frost.ice, bg = c.polar_night.bright },
  qfLineNr = { fg = c.frost.artic_water },
  qfFileName = { fg = c.frost.ice },
  DiffAdd = utils.make_diff(c.aurora.green),
  DiffChange = utils.make_diff(c.aurora.yellow),
  DiffDelete = utils.make_diff(c.aurora.red),
  DiffText = utils.make_diff(c.frost.artic_water),
  diffAdded = { link = "DiffAdd" },
  diffChanged = { link = "DiffChange" },
  diffRemoved = { link = "DiffDelete" },
  Added = { link = "DiffAdd" },
  Changed = { link = "DiffChange" },
  Removed = { link = "DiffDelete" },
  healthError = { fg = c.aurora.red },
  healthSuccess = { fg = c.aurora.green },
  healthWarning = { fg = c.aurora.yellow },
  WinBar = { bg = c.polar_night.origin },
  WinBarNC = { bg = c.polar_night.origin },
}

-- https://neovim.io/doc/user/syntax/#group-name
local group_syntax = {
  Bold = { bold = true },
  Boolean = { fg = c.frost.artic_water },
  Character = { fg = c.aurora.green },
  Conditional = { fg = c.frost.artic_water },
  Constant = { fg = c.snow_storm.origin },
  Comment = vim.tbl_extend("force", { fg = c.polar_night.light }, options.styles.comments),
  Debug = { fg = c.snow_storm.origin },
  Define = { fg = c.frost.artic_water },
  Delimiter = { fg = c.snow_storm.brightest },
  Error = { fg = c.snow_storm.origin, bg = c.aurora.red },
  Error = utils.make_error(c.aurora.red),
  Exception = { fg = c.frost.artic_water },
  Float = { fg = c.aurora.purple },
  Function = vim.tbl_extend("force", { fg = c.frost.ice }, options.styles.functions),
  Identifier = vim.tbl_extend("force", { fg = c.snow_storm.origin }, options.styles.variables),
  Include = { fg = c.frost.artic_water },
  Italic = { italic = true },
  Keyword = vim.tbl_extend("force", { fg = c.frost.artic_water }, options.styles.keywords),
  Label = { fg = c.frost.artic_water },
  Macro = { link = "Define" },
  Number = { fg = c.aurora.purple },
  Operator = { fg = c.frost.artic_water },
  PreCondit = { link = "PreProc" },
  PreProc = { fg = c.frost.artic_water },
  Repeat = { fg = c.frost.artic_water },
  Special = { fg = c.snow_storm.origin },
  SpecialChar = { fg = c.aurora.yellow },
  SpecialComment = { fg = c.frost.ice },
  Statement = { fg = c.frost.artic_water },
  StorageClass = { fg = c.frost.artic_water },
  String = { fg = c.aurora.green },
  Structure = { fg = c.frost.artic_water },
  Tag = { fg = c.snow_storm.origin },
  Todo = { fg = c.aurora.yellow, bg = c.none },
  Type = { fg = c.frost.artic_water },
  Typedef = { fg = c.frost.artic_water },
  Underlined = { underline = true },
  Ignore = {},

  htmlH1 = { fg = c.frost.ice, bold = true },
  htmlH2 = { fg = c.frost.ice },

  markdownHeadingDelimiter = { fg = c.frost.polar_water },
  markdownCode = { fg = c.frost.polar_water },
  markdownCodeBlock = { fg = c.snow_storm.origin },
  markdownH1 = { fg = c.frost.ice, bold = true },
  markdownH2 = { fg = c.frost.ice },
  markdownLinkText = { fg = c.frost.ice, underline = true },
  markdownBlockquote = { fg = c.frost.polar_water },
  markdownFootnote = { fg = c.frost.polar_water },
  markdownId = { fg = c.frost.polar_water },
  markdownIdDeclaration = { fg = c.frost.polar_water },
  markdownUrl = { fg = c.snow_storm.origin },

  yamlBlockMappingKey = { fg = c.frost.ice },
  yamlBool = { link = "Boolean" },

  debugPC = { bg = utils.darken(c.frost.artic_water, 0.3) },
  debugBreakpoint = { bg = utils.darken(c.frost.artic_ocean, 0.1), fg = c.frost.artic_water },
}
