vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/OXY2DEV/markview.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/kaarmu/typst.vim",
	"https://github.com/mbbill/undotree",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mikavilpas/yazi.nvim",
	-- "https://github.com/saghen/blink.cmp",
})

vim.cmd.colorscheme("kanagawa-dragon")
-- require("blink").setup({
-- 	dependencies = { "rafamadriz/friendly-snippets" },
-- 	version = "1.*",
-- 	opts = {
-- 		keymap = { preset = "super-tab" },
-- 		appearance = {
-- 			nerd_font_variant = "mono",
-- 		},
-- 		completion = { documentation = { auto_show = false } },
-- 		sources = {
-- 			default = { "lsp", "path", "snippets", "buffer" },
-- 		},
-- 		fuzzy = { implementation = "prefer_rust_with_warning" },
-- 	},
-- 	opts_extend = { "sources.default" },
-- })

require("yazi").setup({
	dependencies = {
		{ "nvim-lua/plenary.nvim"},
	},
	keys = {
		{
			"<leader>-",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
})
--
-- require("lazygit").setup({
-- 	cmd = {
-- 		"LazyGit",
-- 		"LazyGitConfig",
-- 		"LazyGitCurrentFile",
-- 		"LazyGitFilter",
-- 		"LazyGitFilterCurrentFile",
-- 	},
-- 	-- optional for floating window border decoration
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 	},
-- 	-- setting the keybinding for LazyGit with 'keys' is recommended in
-- 	-- order to load the plugin when the command is run for the first time
-- 	keys = {
-- 		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
-- 	},
-- })
--
require("conform").setup({
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		-- I want to do a command in order to format only when i want to
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
})
require("kanagawa").setup({ opts = { transparent = true } })

require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = "auto",
		component_separators = "",
		section_separators = "",
	},

	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = {
			function()
				encoding = vim.o.fileencoding
				if encoding == "" then
					return vim.bo.fileformat .. " :: " .. vim.bo.filetype
				else
					return encoding .. " :: " .. vim.bo.fileformat .. " :: " .. vim.bo.filetype
				end
			end,
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

vim.keymap.set("n", "<leader> ", require("fzf-lua").files, { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>g", require("fzf-lua").live_grep, { desc = "Fuzzy find text" })
vim.keymap.set("n", "<leader>b", require("fzf-lua").buffers, { desc = "Fuzzy find buffers" })
vim.keymap.set("n", "<leader>h", require("fzf-lua").helptags, { desc = "Fuzzy find help-pages" })
