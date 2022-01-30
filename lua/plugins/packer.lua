local packer_install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_install_path)
end

vim.cmd [[
	augroup Packer
	autocmd!
	autocmd BufWritePost init.lua PackerCompile
	augroup end
]]


local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use 'neovim/nvim-lspconfig'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', }
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons', },
		config = function() require'nvim-tree'.setup {} end
	}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons', },
		config = function() require'nvim-tree'.setup {} end
	}

	use { 'folke/which-key.nvim' }

end)


-- inline configuration -------------------------------------------------------

-- LSP ---

