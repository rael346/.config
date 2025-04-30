-- <space> as leader
-- NOTE: must happen before the plugins are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nerd font in terminal
vim.g.have_nerd_font = true

-- relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- mouse mode for resizing splits
vim.opt.mouse = "a"

-- block cursor for normal mode and underline for insert
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:hor20,r-cr-o:ver25"

-- don't show the cursor mode, since the status line already has it
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- long lines will break and indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- New splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- obsidian
vim.opt.conceallevel = 1
