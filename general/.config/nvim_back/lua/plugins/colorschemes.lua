return {
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
		opts = {
			transparent = true, -- Enable global transparency
		},
	},
	{
		"vague2k/vague.nvim",
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				-- optional configuration here
			})
		end,
	},
}
