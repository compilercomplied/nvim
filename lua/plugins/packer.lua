local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function(use)

	use { 'wbthomason/packer.nvim' }


	-- Code ---------------------------------------------------------------------
	use { 'L3MON4D3/LuaSnip' }
	use { 'neovim/nvim-lspconfig' }

	use { 'hrsh7th/nvim-cmp',
		requires = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'saadparwaiz1/cmp_luasnip' },
		}
	}


	--- Utils -------------------------------------------------------------------
	use { 'folke/which-key.nvim' }
	use { 'tpope/vim-fugitive' }

	use { 'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	use { 'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons', },
		config = function() require'nvim-tree'.setup {} end
	}

	use { 'terrortylor/nvim-comment',
		config = function() require'nvim_comment'.setup {} end
	}
	use { 'yamatsum/nvim-cursorline',
		config = function() require('nvim-cursorline').setup {
			cursorline = {
				enable = true,
				timeout = 750
			},
			cursorword = {
				enable = true,
				min_length = 2
			}

		} end
	}


	--- Eye candy ---------------------------------------------------------------
	use { 'overcache/NeoSolarized' }
	use { 'folke/tokyonight.nvim' }

	use { 'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', },
	}


	-----------------------------------------------------------------------------
  if Packer_bootstrap then
    require('packer').sync()
  end

end)
