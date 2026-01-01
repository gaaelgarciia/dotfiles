-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd.colorscheme("kanagawa-dragon")
vim.cmd([[au BufRead,BufNewFile *.lp set filetype=clingo]])

vim.opt.shiftwidth = 2
vim.o.breakindent = true

vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.o.relativenumber = true
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "grey" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "white" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "grey" })

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "Toggle Zen Mode" })

vim.keymap.set("n", "<leader> ", require("fzf-lua").files, { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>g", require("fzf-lua").live_grep, { desc = "Fuzzy find text" })
vim.keymap.set("n", "<leader>b", require("fzf-lua").buffers, { desc = "Fuzzy find buffers" })
vim.keymap.set("n", "<leader>h", require("fzf-lua").helptags, { desc = "Fuzzy find help-pages" })

vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- vim.keymap.set({ "n", "t" }, "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set({ "n", "t" }, "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set({ "n", "t" }, "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set({ "n", "t" }, "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<S-h>", ":-tabnext<CR>", { desc = "Move to the previous tab" })
vim.keymap.set("n", "<S-l>", ":+tabnext<CR>", { desc = "Move to the next tab" })

local set = vim.opt_local

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0

		vim.bo.filetype = "terminal"
	end,
})

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", ",st", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
	vim.wo.winfixheight = true
	vim.cmd.term()
end)

-- Hot reload for python code
-- Reusable terminal for running Python files
local term_win, term_buf, prev_win

vim.keymap.set("n", "<leader>r", function()
	-- Always get the file path BEFORE entering terminal
	local file = vim.fn.expand("%:p")
	vim.cmd("w")
	prev_win = vim.api.nvim_get_current_win()

	-- Create terminal if it doesn't exist
	if not term_buf or not vim.api.nvim_buf_is_valid(term_buf) then
		vim.cmd("30vs | terminal")
		term_win = vim.api.nvim_get_current_win()
		term_buf = vim.api.nvim_get_current_buf()
	end

	-- Reuse terminal
	vim.api.nvim_set_current_win(term_win)
	vim.cmd("startinsert")
	vim.api.nvim_chan_send(vim.b[term_buf].terminal_job_id, "python3 " .. file .. "\n")
	vim.api.nvim_set_current_win(prev_win)
	vim.cmd("stopinsert") -- exits insert mode and goes to normal mode
end)
