return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    opts = {
      transparent = true, -- Enable global transparency
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Existing overrides...
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- Line number related highlight groups
          LineNr = { bg = "none" }, -- Line number
          CursorLineNr = { bg = "none" }, -- Current line number
          SignColumn = { bg = "none" }, -- Sign column (gutter)
          FoldColumn = { bg = "none" }, -- Fold indicators column

          -- Rest of your existing overrides...
          NormalDark = { fg = theme.ui.fg_dim, bg = "none" },
          LazyNormal = { bg = "none", fg = theme.ui.fg_dim },
          MasonNormal = { bg = "none", fg = theme.ui.fg_dim },

          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "none" },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = "none" },
          TelescopePreviewNormal = { bg = "none" },
          TelescopePreviewBorder = { bg = "none", fg = theme.ui.bg_dim },

          Pmenu = { fg = theme.ui.shade0, bg = "none" },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = "none" },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
    },
  },
}
