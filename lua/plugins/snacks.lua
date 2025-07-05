return {
  'folke/snacks.nvim',
  dependencies = {},
  -- Some plugins require snacks.nvim to be loaded early 
  priority = 1000,
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
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
