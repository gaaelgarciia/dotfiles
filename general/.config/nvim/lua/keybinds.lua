local kms = vim.keymap.set

--Vim-tmux-navigator keymaps--
kms("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
kms("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
kms("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
kms("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
kms("n", "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>")

--fzf-lua keybinds--
kms("n", "<leader> ", require("fzf-lua").files, { desc = "Fuzzy find files" })
kms("n", "<leader>g", require("fzf-lua").live_grep, { desc = "Fuzzy find text" })
kms("n", "<leader>b", require("fzf-lua").buffers, { desc = "Fuzzy find buffers" })
kms("n", "<leader>h", require("fzf-lua").helptags, { desc = "Fuzzy find help-pages" })

kms("n", "<leader>-", "<cmd>Ex %:p:h<CR>", { desc = "launch Netrw on the current file dir" })

kms("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })


--lsp--

kms("n","grn", vim.lsp.buf.rename, {desc = "[R]e[n]ame"})
kms({ "n", "x" },"gra", vim.lsp.buf.code_action, {desc = "[G]oto Code [A]ction"})
kms("n","grr", require("fzf-lua").lsp_references, {desc = "[G]oto [R]eferences"})
kms("n","gri", require("fzf-lua").lsp_implementations, {desc="[G]oto [I]mplementation"})
kms("n","grd", require("fzf-lua").lsp_definitions, {desc="[G]oto [D]efinition"})
kms("n","grD", vim.lsp.buf.declaration, {desc = "[G]oto [D]eclaration"})
kms("n","gO", require("fzf-lua").lsp_document_symbols, {desc = "Open Document Symbols"})
kms("n","gW", require("fzf-lua").lsp_live_workspace_symbols, {desc = "Open Workspace Symbols"})
kms("n","grt", require("fzf-lua").lsp_typedefs, {desc = "[G]oto [T]ype Definition"})

-- Easily hit escape in terminal mode.
kms("t", "<esc><esc>", "<c-\\><c-n>")

-- Open a terminal at the bottom of the screen with a fixed height.
kms("n", ",st", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
	vim.wo.winfixheight = true
	vim.cmd.term()
end)

-- LazyGit keymap--
kms("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
