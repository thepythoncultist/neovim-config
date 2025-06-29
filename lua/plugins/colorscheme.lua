-- I'm lazy, so just uncomment the enabled = false line to enable a colourscheme

return {
  {
    "catppuccin/nvim",
    enabled = false,
    config = function()
      vim.cmd("colorscheme catppuccin \"catppuccin-mocha\"")
    end,
  },

  {
    "morhetz/gruvbox",
    -- enabled = false,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
  },
}

