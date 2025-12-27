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
	use { 'wbthomason/packer.nvim' }

	-- Code ---------------------------------------------------------------------
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require('plugins.nvim_treesitter') end
	}

	use {
		'saghen/blink.cmp',
		tag = 'v1.7.0',
		config = function() require('plugins.blink_cmp') end
	}
	use { 'neovim/nvim-lspconfig' }
	-- drop in replacement for typescript-language-server
	use {
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("typescript-tools").setup {}
		end,
	}


	--- Utils -------------------------------------------------------------------
	use { 'folke/which-key.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', },
		config = function() require('plugins.which-key') end
	}
	use { 'williamboman/mason.nvim',
		requires = { 'williamboman/mason-lspconfig.nvim' },
		config = function() require('plugins.mason') end
	}
	use { 'tpope/vim-fugitive' }

	use { 'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	use { 'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons', },
		config = function() require('plugins.nvim-tree') end
	}

	use { 'terrortylor/nvim-comment',
		config = function() require 'nvim_comment'.setup {} end
	}
	use { 'yamatsum/nvim-cursorline',
		config = function() require('plugins.nvim_cursorline') end
	}

	use { 'jvirtanen/vim-hcl' }


	--- Eye candy ---------------------------------------------------------------
	use { 'rebelot/kanagawa.nvim' }
	use { 'ellisonleao/gruvbox.nvim' }
	use { 'overcache/NeoSolarized' }
	use { 'shaunsingh/nord.nvim' }
	use { 'sainnhe/everforest' }

	use { 'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', },
		config = function() require('plugins.lualine') end
	}


	-----------------------------------------------------------------------------
	if packer_was_bootstrapped then
		require('packer').sync()
	end
end)