local vim = vim
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)

	-- Plugin manager
	use {'wbthomason/packer.nvim'}

	-- Theme
	use {'Mofiqul/vscode.nvim'}

	-- Dashboard (Welcome screen)
	use {'glepnir/dashboard-nvim'}

	-- Tab buffer (Upper part UI)
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

	-- Windows bar (Breadcrumbs) (Below Tab Buffer)
	use {
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig"
	}

	-- Status line (Lower part UI)
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- File Explorer
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}
	}

	-- Outline manager
	use 'simrat39/symbols-outline.nvim'

	-- Treesitter
	use {'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'}}
	use {'nvim-treesitter/playground'}

	-- LSP 
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
end)
