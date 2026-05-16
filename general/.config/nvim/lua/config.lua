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

local git_branch_cache = ""

local function update_git_branch()
	local inside = vim.fn.systemlist("git rev-parse --is-inside-work-tree 2>/dev/null")[1]

	if inside ~= "true" then
		git_branch_cache = "no repo"
		return
	end
	local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD 2>/dev/null")[1]
	if branch == "" or branch == nil then
		git_branch_cache = ""
	else
		git_branch_cache = branch
	end
end

local function git_branch()
	return git_branch_cache
end

vim.cmd([[
  highlight StatusLine guifg=#c5c9c5 guibg=none
]])

local statusline = {
	"%#StatusLine# %{v:lua.mode()} |",
	" %{v:lua.git_branch()} |",
	" %t",
	" %r",
	" %m",
	"%=",
	"%{&filetype} ",
	"[%2p%% %3l:%-2c]",
}

_G.mode = mode
_G.git_branch = git_branch
_G.update_git_branch = update_git_branch
vim.o.statusline = table.concat(statusline, "")

-- Update branch on events (buffer enter, write, etc.)
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "VimEnter", "FocusGained" }, {
	callback = update_git_branch,
})

-- Update branch also if changed inside of vim with :!git ...
vim.api.nvim_create_autocmd("ShellCmdPost", {
	pattern = "!git*",
	callback = function()
		_G.update_git_branch()
	end,
})

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
vim.o.showmode = false

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

-- LazyGit keymap--
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
