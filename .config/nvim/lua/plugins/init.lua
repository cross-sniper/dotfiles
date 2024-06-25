
return {
	-- Individual plugin configurations with lazy loading
	{ "folke/neodev.nvim" },
	{ "folke/which-key.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{"williamboman/mason.nvim"},
	{'nvim-lua/plenary.nvim'},
	{'nvim-telescope/telescope.nvim'},
	{'habamax/vim-godot'},
	{'ghifarit53/tokyonight-vim'},
	{'voldikss/vim-floaterm'},
	{'vim-airline/vim-airline-themes'},
	{'vim-airline/vim-airline'},
	{'preservim/nerdcommenter'},
	{'preservim/nerdtree'}
}
