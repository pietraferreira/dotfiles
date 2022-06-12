-- Make mapping easier
local map = require("utils").map

-- Map leader key
vim.g.mapleader = ","

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<Leader>fg", ":Telescope live_grep<CR>", { silent = true })

-- Turn numbers on/off
map("n", "<Leader>N", ":setlocal number!<CR>", { silent = true })

-- Nvim Tree
map("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
