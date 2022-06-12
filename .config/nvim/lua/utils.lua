-- Make mapping nice
local M = {}

function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Check for instalation status of plugin.
function M.is_plugin_installed(plugins_name)
  if
    fn.empty(fn.glob(M.plugins_path .. "/start/" .. plugins_name)) > 0
    and fn.empty(fn.glob(M.plugins_path .. "/opt/" .. plugins_name)) > 0
  then
    return false
  else
    return true
  end
end

return M
