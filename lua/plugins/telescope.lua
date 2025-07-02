return {
  'nvim-telescope/telescope.nvim', 
  dependencies = { 'nvim-lua/plenary.nvim'},
  config = function()
    require('telescope').setup{}
    vim.keymap.set('n', 'F', '<cmd>Telescope find_files<CR>')
    vim.keymap.set('n', '<C-f>', '<cmd>Telescope git_files<CR>') 
  end,
}
