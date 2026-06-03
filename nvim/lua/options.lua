-- <space> as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nerd font in terminal
vim.g.have_nerd_font = true

-- 2 spaces indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- enable mouse mode
vim.opt.mouse = "a"

-- disable horizontal scroll
vim.opt.mousescroll = "ver:3,hor:0"

-- long lines will break and indent
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

-- save undo history
vim.opt.undofile = true

--
vim.opt.signcolumn = "yes"

-- timeout for keystroke
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 50

-- block cursor for normal mode and underline for insert
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:hor20,r-cr-o:ver25"

-- completion
vim.opt.wildignore:append({ ".DS_Store" })
vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.pumheight = 15
vim.o.pumborder = "rounded"

-- if performing an operation that would fail due
-- to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to
-- save the current file(s)
vim.opt.confirm = true

-- Minimal number of screen lines to keep
-- above and below the cursor.
vim.opt.scrolloff = 15

-- New split position
vim.opt.splitright = true
vim.opt.splitbelow = true

-- don't show the cursor mode,
-- since the status line already has it
vim.opt.showmode = false

-- Case-insensitive searching UNLESS
-- \C or one or more capital letters in
-- the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- set border on floating windows
vim.opt.winborder = "rounded"

-- disable swapfile
vim.opt.swapfile = false

-- -- Preview substitutions live, as you type!
-- vim.opt.inccommand = 'split'

-- -- obsidian
-- vim.opt.conceallevel = 2
-- vim.g.markdown_recommended_style = 0
