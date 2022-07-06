local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
    -- Python
		formatting.black.with({ extra_args = { "--fast" } }),
    -- diagnostics.flake8,
    -- MD
    --diagnostics.write_good,
    -- Lua
    --  diagnostics.selene, (can't handle vim.)
		formatting.stylua,
    -- C/Cpp and Java
    formatting.uncrustify,
    formatting.astyle,
    -- Java
    diagnostics.semgrep,
    -- Typescript
    diagnostics.eslint,
    code_actions.eslint,
    formatting.prettier
	},
})
