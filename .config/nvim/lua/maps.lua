-- Make mapping easier
local map = require("utils").map
local Gitsigns  = package.loaded.gitsigns

-- Map leader key
vim.g.mapleader = ","

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<Leader>fg", ":Telescope live_grep<CR>", { silent = true })

-- Turn numbers on/off
map("n", "<Leader>N", ":setlocal number!<CR>", { silent = true })

-- Nvim Tree
map("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })

-- Gitsigns
-- map('n', '<Leader>hs', ':Gitsigns stage_hunk<CR>', { silent = true })
-- map('n', '<Leader>hr', ':Gitsigns reset_hunk<CR>', { silent = true })
-- map('n', '<Leader>hS', ':Gitsigns stage_buffer<CR>', { silent = true })
-- map('n', '<Leader>hu', ':Gitsigns undo_stage_hunk<CR>', { silent = true })
-- map('n', '<Leader>hR', ':Gitsigns reset_buffer<CR>', { silent = true })
-- map('n', '<Leader>hp', ':Gitsigns preview_hunk<CR>', { silent = true })
-- map('n', '<Leader>tb', ':Gitsigns toggle_current_line_blame<CR>', { silent = true })
-- map('n', '<Leader>hd', ':Gitsigns diffthis<CR>', { silent = true })
-- map('n', '<Leader>td', ':Gitsigns toggle_deleted<CR>', { silent = true })
