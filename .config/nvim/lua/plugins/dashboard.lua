return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          {key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          {key = "n", desc = "New File", action = ":ene | startinsert" },
          {key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          {key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          {key = "y", desc = "Yazi", action = ":Yazi" },
          {key = "l", desc = "Lazy", action = ":Lazy" },
          {key = "q", desc = "Quit", action = ":qa"}
        },
      },
    },
  },
}
