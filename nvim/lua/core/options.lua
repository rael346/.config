vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.mouse = 'a'
opt.guicursor = 'n-v-c-sm:block,i-ci-ve:hor20,r-cr-o:ver25'

opt.showmode = false
opt.clipboard = 'unnamedplus'

opt.breakindent = true
opt.undofile = true

-- Case-insensitive searching
opt.ignorecase = true
opt.smartcase = true

-- New splits
opt.splitright = true
opt.splitbelow = true

opt.updatetime = 250
opt.timeoutlen = 300

opt.scrolloff = 10

opt.tabstop = 2
opt.shiftwidth = 2

opt.signcolumn = 'yes'

opt.hlsearch = true