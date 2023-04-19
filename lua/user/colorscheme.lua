local M = {
  "LunarVim/darkplus.nvim",
  commit = "1a35b1f1a3606cdd914847db962dd0bc362fa706",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

M.name = "darkplus"
function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
