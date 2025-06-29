local function on_attach_binds(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  -- api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close directory'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Remove'))
  vim.keymap.set('n', 'n', api.fs.create, opts('Create new file/directory'))
  vim.keymap.set('n', 'r', api.tree.change_root_to_node, opts('Change root to selection'))

end

require("nvim-tree").setup{
  on_attach = on_attach_binds,

  renderer = {
    indent_markers = {
      enable = true,
    },
  },  
}

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
vim.schedule(function()
  -- Put highlight overrides here to stop them being blocked by colorscheme = {}
  vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { link = 'NvimTreeFolderIcon' })
end)
