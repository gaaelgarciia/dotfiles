local state = {
	buf = nil,
	win = nil,
}

local function create_toggeable_terminal()
	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(buf, true, { height = 10 })
	return { buf = buf, win = win }
end

vim.api.nvim_create_user_command("Toggableterminal", function()
	state.terminal = create_toggeable_terminal()
	print(state.terminal.win)
	vim.api.nvim_open_term(state.terminal.buf, {})
end, {})
