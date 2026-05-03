return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		priority = 49,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = ":call mkdp#util#install()",
	},
}
