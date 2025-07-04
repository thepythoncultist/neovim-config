return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'master',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup {
      ensure_installed = { 'python', 'lua', 'nix', 'markdown', 'markdown-inline', 'vim', 'vimdoc', 'c', 'cpp' },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
    }
    vim.o.conceallevel = 1
    vim.o.concealcursor = 'n'
  end,
}
