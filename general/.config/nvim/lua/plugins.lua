vim.g.mapleader = " "

vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/OXY2DEV/markview.nvim",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/lervag/vimtex",
	"https://github.com/christoomey/vim-tmux-navigator",
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

-- Vimtex config--
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
