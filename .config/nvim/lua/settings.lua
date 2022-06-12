-- Defining alias for vim.opt.
local set = vim.opt
local exec = vim.api.nvim_exec

-- Defining alias for some functions.
-- local is_plugin_installed = require("utils").is_plugin_installed
local autocmd = vim.api.nvim_create_autocmd

-- Choose theme
vim.cmd[[colorscheme tokyonight]]

-- Using new filetype detection system(written in lua).
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- Decrease time of completion menu.
set.updatetime = 300

-- Set cursorhold updatetime(:  .
vim.g.cursorhold_updatetime = 100

-- Set file encoding to utf-8.
set.fileencoding = "utf-8"

-- Line number settings.
set.number = true
set.numberwidth = 2
set.relativenumber = false

-- Set signcolumn to false
vim.opt.signcolumn = "no"

-- Remove showing mode.
set.showmode = false

-- Adding true color to NeoVim.
set.termguicolors = true

-- Enable clipboard.
set.clipboard = "unnamedplus"

-- Set indentation stuf.
set.tabstop = 2
set.shiftwidth = 2
set.textwidth = 80
set.smartindent = true
set.smartcase = true
-- Tab to spaces
set.expandtab = true

-- Setting completion menu height.
set.pumheight = 20 -- pop up menu height.

-- Set searching stuf.
set.hlsearch = true
set.incsearch = true
set.ignorecase = true

-- Without this option some times backspace did not work correctly.
set.backspace = "indent,eol,start"

-- For opening splits on right or bottom.
set.splitbelow = true
set.splitright = true

-- Setting time that Neovim wait after each keystroke.
set.timeoutlen = 200

-- Setting up autocomplete menu.
set.completeopt = { "menuone", "noselect" }

-- Testing
set.visualbell = true
vim.o.cursorline = true
set.guicursor = "n-v-c:block"

-- Creates a backup file
set.backup = false

-- Allow access to system clipboard
set.clipboard = "unnamedplus"

-- So that `` is visible in markdown files
set.fileencoding = "utf-8"

-- Creates a swap file
set.swapfile = false

-- Enable persistent undo
set.undofile = true

-- Display lines as one long line
set.wrap = false

-- Start scrolling 8 before the end of page
set.scrolloff = 8

-- Column so I know the limit
set.colorcolumn = "80"

-- Don't continue comment on next line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
