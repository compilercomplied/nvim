local packerBootstrapper = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_was_bootstrapped = packerBootstrapper()

return require('packer').startup(function(use)
	-- The plugin manager. Has to be first call.
	use { 'wbthomason/packer.nvim' }

	-- Code ---------------------------------------------------------------------
	-- Better syntax highlighting and code-aware commands.
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require('plugins.nvim_treesitter') end
	}

	-- Completion plugin.
	use {
		'saghen/blink.cmp',
		tag = 'v1.7.0',
		config = function() require('plugins.blink_cmp') end
	}
	-- Builtin nvim LSP.
	use { 'neovim/nvim-lspconfig' }
	-- Drop in replacement for typescript-language-server
	use {
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}

	-- Git wrapper
	use { 'tpope/vim-fugitive' }
	-- Better git diffs
	use { 'sindrets/diffview.nvim' }


	--- Utils -------------------------------------------------------------------
	-- Displays keymaps in a popup. Useful as a guide.
	use { 'folke/which-key.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', },
		config = function() require('plugins.which-key') end
	}
	-- Package manager for LSP/DAP/Linters. Autoinstalls LSP servers.
	use { 'williamboman/mason.nvim',
		requires = { 'williamboman/mason-lspconfig.nvim' },
		config = function() require('plugins.mason') end
	}

	-- Fuzzy finder
	use { 'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	-- File explorer
	use { 'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons', },
		config = function() require('plugins.nvim_tree') end
	}

	-- Comment toggler
	use { 'terrortylor/nvim-comment',
		config = function() require 'nvim_comment'.setup {} end
	}
	-- Highlight word under cursor
	use { 'yamatsum/nvim-cursorline',
		config = function() require('plugins.nvim_cursorline') end
	}

	-- Markdown previewer
	use { 'OXY2DEV/markview.nvim' }

	--- Eye candy ---------------------------------------------------------------
	use { 'rebelot/kanagawa.nvim' }
	use { 'sainnhe/gruvbox-material' }
	use { 'overcache/NeoSolarized' }
	use { 'shaunsingh/nord.nvim' }
	use { 'sainnhe/everforest' }
	use { 'catppuccin/nvim' }
	use { 'EdenEast/nightfox.nvim' }

	-- Statusline.
	use { 'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', },
		config = function() require('plugins.lualine') end
	}


	-----------------------------------------------------------------------------
	if packer_was_bootstrapped then
		require('packer').sync()
	end
end)
