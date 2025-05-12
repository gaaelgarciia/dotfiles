-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd([[colorscheme kanagawa-dragon]])
vim.cmd([[au BufRead,BufNewFile *.lp set filetype=clingo]])
vim.cmd([[set completeopt=noinsert,popup]])
