return {
  'folke/snacks.nvim',
  dependencies = {},
  -- Some plugins require snacks.nvim to be loaded early 
  priority = 1000,
  opts = {
    dashboard = {
      enabled = true,
      sections = {
        { section = 'header' },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = '󱀲', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { section = 'terminal', cmd = 'fortune | cowsay -f sus', pane = 2, height = 14, width = 50, indent = 2, padding = 1 },
        { icon = '󰊢', title = 'Recent Repos', section = 'projects', indent = 2, padding = 1, pane = 2 },
      },
    },
    indent = {
      priority = 1,
      enabled = true,
    },
  },  
}
