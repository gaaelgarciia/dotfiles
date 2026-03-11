return {
	"epwalsh/obsidian.nvim",
	version = "*", --  use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "obsidian-notes",
				path = "~/notes/obsidian-notes",
			},
		},
		picker = { name = "fzf-lua" },
		disable_frontmatter = true,
		ui = { enable = false },
	},
}
