local M = {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy"
}

function M.config()
  require("nvim-surround").setup {
    keymaps = {
      insert = "<C-g>s",
      insert_line = "<C-g>S",
      normal = "ys",
      normal_cur = "yss",
      normal_line = "yS",
      normal_cur_line = "ySS",
      visual = "s",
      visual_line = "gs",
      delete = "ds",
      change = "cs",
    },
  }
end

return M
