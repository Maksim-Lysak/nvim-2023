vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Plugin manager
	use 'wbthomason/packer.nvim'

	-- Colorshems
	use 'martinsione/darkplus.nvim'

	-- Status line
	use 'nvim-lualine/lualine.nvim'

	-- Icons
	use 'kyazdani42/nvim-web-devicons'

	-- Comment
	use 'terrortylor/nvim-comment'

	-- Functional side menu
	use 'kyazdani42/nvim-tree.lua'
	use 'kylechui/nvim-surround'
	use 'windwp/nvim-autopairs'

	-- Useful lua functions used ny lots of plugins
	use 'nvim-lua/plenary.nvim'

	use "folke/trouble.nvim"
	use { 'windwp/nvim-ts-autotag' }
	use { 'phaazon/hop.nvim', branch = 'v2' }
	use { 'akinsho/bufferline.nvim', tag = 'v2.*' }
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- LSP
	use 'onsails/lspkind-nvim'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use { "glepnir/lspsaga.nvim", branch = "main", }

	-- Completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'saadparwaiz1/cmp_luasnip'

	-- Snippets
	use 'L3MON4D3/LuaSnip'

	-- Code runner
	use 'CRAG666/code_runner.nvim'

	-- Formating and diagnostics code
	use 'jose-elias-alvarez/null-ls.nvim'

end)
