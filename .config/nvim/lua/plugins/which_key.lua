local is_plugin_installed = require("utils").is_plugin_installed

require("which-key").setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      nav = true,
      z = false,
      g = false,
      windows = false, -- default bindings on <c-w>
    },
  },
  key_labels = {
    ["<space>"] = "SPC",
    ["<leader>"] = "SPC",
    ["<cr>"] = "ENT",
    ["<tab>"] = "TAB",
    ["<a>"] = "ALT",
    ["<s>"] = "SHI",
    ["<c>"] = "CTR",
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  ignore_missing = false,
}

local present, which_key = pcall(require, "which-key")
if not present then
  return
end

-- Packer
which_key.register({
  p = {
    name = "Packer",
    i = { ":PackerInstall<CR>", "Install packages" },
    u = { ":PackerUpdate<CR>", "Update packages" },
    r = { ":PackerClean<CR>", "Uninstall unnecessary packages" },
    s = { ":PackerSync<CR>", "Sync packages" },
    c = { ":PackerCompile<CR>", "Compile packages" },
  },
}, { prefix = "<leader>" })

-- Nvim Tree
which_key.register({
  n = {
    name = "NvimTree",
    e = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
    f = { ":NvimTreeFocus<CR>", "Focus on NvimTree" },
  },
}, { prefix = "<leader>" })

-- Telescope
which_key.register({
  f = {
    name = "Find",
    w = { ":Telescope live_grep<CR>", "Word" },
    f = { ":Telescope find_files<CR>", "File" },
    o = { ":Telescope oldfiles<CR>", "Old File" },
    d = { ":Telescope find_directories<CR>", "Directory" },
    b = { ":Telescope buffers<CR>", "Buffer" },
    h = { ":Telescope help_tags<CR>", "Help File" },
    B = { ":Telescope marks<CR>", "Find BookMark" },
  },
}, { prefix = "<leader>" })

-- Lsp
which_key.register({
  l = {
    name = "LSP",
    s = { ":lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    g = {
      name = "GOTO",
      D = { ":lua vim.lsp.buf.declaration()<CR>", "Go To Declaration" },
      i = { ":lua vim.lsp.buf.implementation()<CR>", "Go To Implementation" },
      d = { "::lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
      t = { ":lua vim.lsp.buf.type_definition()<CR>", "Go To Type Definition" },
    },
    w = {
      name = "Workspace",
      l = { ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Workspace Folder" },
      a = { ":lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace Folder" },
      r = { ":lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace Folder" },
    },
    l = {
      name = "List Reference/Diagnostic",
      d = { ":lua vim.lsp.diagnostic.set_loclist()<CR>", "List Diagnostic" },
      r = { ":lua vim.lsp.buf.references()<CR>", "Show References" },
    },
  },
}, { prefix = "<leader>" })

-- Git keybinds.
which_key.register ({
  g = {
    name = "Git",
      s = { ":Telescope git_status<CR>", "Status + Git Diff" },
      c = { ":Telescope git_commits<CR>", "Commit History" },
      C = { ":Telescope git_bcommits<CR>", "Buffer Commit History" },
      b = { ":Telescope git_branches<CR>", "Branches history" },
    m = {
      name = "More",
      k = { ":Gitsigns prev_hunk<CR>", "Prev Hunk" },
      j = { ":Gitsigns next_hunk<CR>", "Next Hunk" },
      p = { ":Gitsigns preview_hunk<CR>", "Preview Hunk" },
      r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
      R = { ":Gitsigns reset_buffer<CR>", "Reset Buffer" },
      d = { ":Gitsigns diffthis<CR>", "Git Diff" },
      l = { ":Gitsigns blame_line<CR>", "Blame For Current Line" },
      S = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
      u = { ":Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
    },
  },
}, { prefix = "<leader>" })

-- Terminal.
local terminal_maps = {
  t = {
    name = "Terminal",
    f = { ":ToggleTerm direction=float<CR>", "Float" },
    h = { ":ToggleTerm direction=horizontal<CR>", "Horizontal" },
    v = { ":ToggleTerm direction=vertical<CR>", "Vertical" },
    l = { ":lua _LAZYGIT_TOGGLE()<cr>", "LazyGit" },
    n = { ":lua _NODE_TOGGLE()<cr>", "Node" },
    H = { ":lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { ":lua _PYTHON3_TOGGLE()<cr>", "Python3" },
  },
}
which_key.register(terminal_maps, { prefix = "<leader>" })
