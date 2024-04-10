local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	

	use {
  		'nvim-tree/nvim-tree.lua',
 	 requires = {
  		  'nvim-tree/nvim-web-devicons', -- optional
  	},
	}

	use {
   	 "mcchrish/zenbones.nvim",
     	 requires = "rktjmp/lush.nvim"
       }

	use("tpope/vim-fugitive") 
	
	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets
	
	--Telescope
	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                            , branch = '0.1.x',
	  	requires = { {'nvim-lua/plenary.nvim'} }
	}
	
	--Alpha-Nvim
	
	use {
    		'goolord/alpha-nvim',
    		config = function ()
        	require'alpha'.setup(require'alpha.themes.dashboard'.config)
    	end
	}

	--Vim-Tex
	
	use 'lervag/vimtex'
	
	--Tree-Sitter
	
	use {
		'nvim-treesitter/nvim-treesitter',
        	run = function()
            	local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            	ts_update()
        	end,
    	}
	
	--Another color-scheme
	
	use "rebelot/kanagawa.nvim"

	--Copilot
	
	use "github/copilot.vim"

	--MarkDown preview

	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

	--Nvim-Colorizer
	
	use 'norcalli/nvim-colorizer.lua'

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

