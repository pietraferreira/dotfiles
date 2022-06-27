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

-- GitHub Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
map("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Indent Blank-Line
map("n", "<Leader>B", ":IndentBlanklineToggle<CR>", { silent = true })

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

-- ToggleTerm
function _G.set_terminal_keymaps()
  map("t", "<esc>", "<C-\\><C-n>")
  map("t", "<A-h>", "<c-\\><c-n><c-w>h")
  map("t", "<A-j>", "<c-\\><c-n><c-w>j")
  map("t", "<A-k>", "<c-\\><c-n><c-w>k")
  map("t", "<A-l>", "<c-\\><c-n><c-w>l")

  map("t", "<S-h>", "<c-\\><C-n>:call ResizeLeft(3)<CR>")
  map("t", "<S-j>", "<c-\\><C-n>:call ResizeDown(1)<CR>")
  map("t", "<S-k>", "<c-\\><C-n>:call ResizeUp(1)<CR>")
  map("t", "<S-l>", "<c-\\><C-n>:call ResizeRight(3)<CR>")
end

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    set_terminal_keymaps()
  end,
})

