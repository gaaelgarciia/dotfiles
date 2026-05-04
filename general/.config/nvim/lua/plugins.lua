vim.g.mapleader = " "

vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/OXY2DEV/markview.nvim",
	-- "https://github.com/nvim-lualine/lualine.nvim",
	-- "https://github.com/kaarmu/typst.vim",
	-- "https://github.com/mbbill/undotree",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/mikavilpas/yazi.nvim",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/lervag/vimtex",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
})

-- Remove unused packages
for _, name in
	ipairs(vim.iter(vim.pack.get())
		:filter(function(x)
			return not x.active
		end)
		:map(function(x)
			return x.spec.name
		end)
		:totable())
do
	vim.pack.del({ name })
end

require("blink.cmp").setup({
	keymap = { preset = "super-tab" },
	appearance = {
		nerd_font_variant = "mono",
		use_nvim_cmp_as_default = true,
	},
	completion = { documentation = { auto_show = false } },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})

-- Vimtex--
-- Viewer depending on OS
if vim.fn.has("macunix") == 1 then
	vim.g.vimtex_view_method = "skim"
elseif vim.fn.has("unix") == 1 then
	vim.g.vimtex_view_method = "zathura"
end

-- Compiler settings
vim.g.vimtex_compiler_latexmk = {
	engine = "xelatex",
}

-- Disable quickfix auto-open
vim.g.vimtex_quickfix_mode = 0

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "black", "isort" },
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
})
require("kanagawa").setup({ opts = { transparent = true } })

-- require("lualine").setup({
-- 	options = {
-- 		icons_enabled = false,
-- 		theme = "auto",
-- 		component_separators = "",
-- 		section_separators = "",
-- 	},
--
-- 	sections = {
-- 		lualine_a = { "mode" },
-- 		lualine_b = { "branch" },
-- 		lualine_c = { "filename" },
-- 		lualine_x = {
-- 			function()
-- 				encoding = vim.o.fileencoding
-- 				if encoding == "" then
-- 					return vim.bo.fileformat .. " :: " .. vim.bo.filetype
-- 				else
-- 					return encoding .. " :: " .. vim.bo.fileformat .. " :: " .. vim.bo.filetype
-- 				end
-- 			end,
-- 		},
-- 		lualine_y = { "progress" },
-- 		lualine_z = { "location" },
-- 	},
-- })

vim.keymap.set("n", "<leader> ", require("fzf-lua").files, { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>g", require("fzf-lua").live_grep, { desc = "Fuzzy find text" })
vim.keymap.set("n", "<leader>b", require("fzf-lua").buffers, { desc = "Fuzzy find buffers" })
vim.keymap.set("n", "<leader>h", require("fzf-lua").helptags, { desc = "Fuzzy find help-pages" })
