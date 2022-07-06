local present, blankline = pcall(require, "indent_blankline")
if not present then
  return
end

local blankline_config = {
  show_trailing_blankline_indent = false,
  indent_blankline_use_treesitter = true,
  show_first_indent_level = true,
  show_current_context = true,
  buftype_exclude = { "terminal", "nofile", "help" },
  filetype_exclude = {
    "help",
    "toggleterm",
    "alpha",
    "packer",
    "lsp-installer",
    "lspinfo",
    "vista_kind",
    "terminal",
    "TelescopePrompt",
    "TelescopeResults",
  },
}

-- Disable indent-blankline on these pages.
blankline.setup(blankline_config)
