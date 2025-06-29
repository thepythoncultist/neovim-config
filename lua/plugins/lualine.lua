return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.cmd("set cmdheight=0")
    require("config.lualine")
  end,
}
