local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

	use { 'wbthomason/packer.nvim' }


	-- Code ---------------------------------------------------------------------
	use { 'L3MON4D3/LuaSnip' }
	use { 'neovim/nvim-lspconfig' }
	use { 'nvim-treesitter/nvim-treesitter' }
	use { 'seblyng/roslyn.nvim' }
	use { 'hrsh7th/nvim-cmp',
		requires = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'saadparwaiz1/cmp_luasnip' },
		}
	}


	--- Utils -------------------------------------------------------------------
	use { 'folke/which-key.nvim' }
	use { 'williamboman/mason.nvim' }
	use { 'williamboman/mason-lspconfig.nvim' }
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
	use { "ellisonleao/gruvbox.nvim" }
	use { 'overcache/NeoSolarized' }
	use { 'shaunsingh/nord.nvim' }
	use { 'sainnhe/everforest' }

	use { 'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', },
	}

	use { 'jvirtanen/vim-hcl' }


	-----------------------------------------------------------------------------
  if packer_bootstrap then
    require('packer').sync()
  end

end)
