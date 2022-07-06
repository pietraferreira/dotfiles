local present, toggle_term = pcall(require, "toggleterm")
if not present then
  return
end

toggle_term.setup({
  open_mapping = "<c-t>",
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = false,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true, -- close the terminal window when the process exits
  float_opts = {
    border = "curved",
    width = 120,
    height = 60,
    winblend = 3,
  },
})

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true, direction = "float" })
function _NODE_TOGGLE()
  node:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })
function _HTOP_TOGGLE()
  htop:toggle()
end

local python3 = Terminal:new({ cmd = "python3", hidden = true, direction = "float" })
function _PYTHON3_TOGGLE()
  python3:toggle()
end
