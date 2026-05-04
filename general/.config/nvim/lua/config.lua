-- Set colorscheme and transparency

vim.cmd.colorscheme("kanagawa-dragon")
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])

--status line--
local function mode()
	local modes = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		["\22"] = "V-BLOCK",
		c = "COMMAND",
		R = "REPLACE",
		t = "TERMINAL",
	}
	return modes[vim.api.nvim_get_mode().mode] or "UNKNOWN"
end

vim.cmd([[
  highlight StatusLine guifg=#c5c9c5 guibg=none
]])

local statusline = {
	"%#MyMode# %{v:lua.mode()} :: ",
	"%f",
	"%r",
	"%m",
	"%=",
	"<Never stop learning>",
	"%=",
	"%{&filetype} ",
	"[%2p%%",
	" %3l:%-2c]",
}

_G.mode = mode
vim.o.statusline = table.concat(statusline, "")

vim.o.shiftwidth = 4
vim.o.breakindent = true

vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1

vim.o.relativenumber = true
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "grey" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "brown" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "grey" })

-- Don't show the mode, since it's already in the status line
vim.keymap.set("n", "<leader>-", "<cmd>Ex %:p:h<CR>", { desc = "launch Netrw on the current file dir" })
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "<S-h>", ":-tabnext<CR>", { desc = "Move to the previous tab" })
vim.keymap.set("n", "<S-l>", ":+tabnext<CR>", { desc = "Move to the next tab" })

-- Terminal config --

-- Set local settings for terminal buffers
local set = vim.opt_local
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
