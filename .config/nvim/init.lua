require("plugins") 
require("keymaps")

--Set termguicolors

vim.opt.termguicolors = true

--Vim-Colorizer

require'colorizer'.setup()

--Vim-Latex

vim.g.vimtex_view_method = "zathura"

--Telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Start vim-cmp

require('nvim-cmp')

-- Start lualine

require('lualine').setup()

-- set colorsheme 

vim.cmd [[colorscheme kanagawa-dragon]]
--vim.cmd [[colorscheme kanagawa-wave]]

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
