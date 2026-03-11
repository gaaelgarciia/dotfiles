return {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			if vim.fn.has("macunix") == 1 then
				vim.g.vimtex_view_method = "skim"
			elseif vim.fn.has("unix") == 1 then
				vim.g.vimtex_view_method = "zathura"
			end

			vim.g.vimtex_compiler_latexmk = {
				engine = "xelatex",
			}
			-- To prevent warning window
			vim.g.vimtex_quickfix_mode = 0
		end,
	},
}
