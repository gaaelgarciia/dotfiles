-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd([[au BufRead,BufNewFile *.lp set filetype=clingo]])
vim.cmd([[colorscheme kanagawa-dragon]])
