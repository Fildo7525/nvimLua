local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
-- vim.notify(install_path)
if fn.empty(fn.glob(install_path)) > 0 then
PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("packer error")
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here
return packer.startup(function(use)
	-- packer itself
	use "wbthomason/packer.nvim" -- Have packer manage itself

	-- SPEEDUP
	use 'lewis6991/impatient.nvim'

	-- ALPHA
	use 'goolord/alpha-nvim'

	-- PROJECTS
	-- use 'ahmedkhalf/project.nvim'

	-- SHOW INDENTATION
	use "lukas-reineke/indent-blankline.nvim"

	-- dependencies
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

	-- colour scheme
	use "ghifarit53/tokyonight-vim" -- colour scheme
	use "sheerun/vim-polyglot"
	use({
		"catppuccin/nvim",
		as = "catppuccin"
	})

	-- SCROLLING --
	use {
		"lewis6991/satellite.nvim",
		commit = "f9d0b08faebe97ccd3822df5d1581b0757c0ca66",
	}
	use "karb94/neoscroll.nvim"

	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use {
		"rafamadriz/friendly-snippets", -- a bunch of snippets to use
		commit = "57274f4d87b9ccb961092b25560ba300f691e943"
	}

		-- cmp plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"	-- lua nvim scripting
	use "windwp/nvim-autopairs"
	-- show function signature
	use "ray-x/lsp_signature.nvim"

	--	LSP
	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/nvim-lsp-installer"
	use 'mfussenegger/nvim-jdtls'
	use 'jose-elias-alvarez/null-ls.nvim'
	use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}
	use {
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{"nvim-lua/plenary.nvim"},
			{"nvim-treesitter/nvim-treesitter"}
		}
	}

	-- LUALINE & BUFFLINE
	use 'nvim-lualine/lualine.nvim'
	use 'akinsho/bufferline.nvim'
	use 'famiu/bufdelete.nvim'

	-- DEVICONS and NVIM-TREE
	use "ryanoasis/vim-devicons"
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'

	-- TELESCOPE
	use 'nvim-telescope/telescope.nvim'
	use "BurntSushi/ripgrep"

	-- TERMINAL POPUP WINDOW
	use "akinsho/toggleterm.nvim"

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use "p00f/nvim-ts-rainbow"

	-- doxygen
	use {
		"danymat/neogen",
		config = function()
			require('neogen').setup {}
		end,
		requires = "nvim-treesitter/nvim-treesitter",
		-- Uncomment next line if you want to follow only stable versions
		tag = "*"
	}
	use "folke/todo-comments.nvim" -- highlight comments like TODO:
	use "MattesGroeger/vim-bookmarks"
	use "github/copilot.vim"
	use "RRethy/vim-illuminate"


	-- markdown files preview
	use {
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
	}

	-- COMMENTING
	use "numToStr/Comment.nvim"
	use "JoosepAlviste/nvim-ts-context-commentstring"

	-- GIT
	use "lewis6991/gitsigns.nvim"
	use "kdheepak/lazygit.nvim"

	-- DAP
	-- use "mfussenegger/nvim-dap"
	-- use "theHamsta/nvim-dap-virtual-text"
	-- use "rcarriga/nvim-dap-ui"
	-- use "Pocco81/DAPInstall.nvim"

	-- ROS
	use 'thibthib18/ros-nvim'
	use 'bi0ha2ard/telescope-ros.nvim'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

