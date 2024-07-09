
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
	{'preservim/nerdtree'},
    {
        "VonHeikemen/fine-cmdline.nvim",
        dependencies = {
            { "MunifTanjim/nui.nvim" }
        }
    },
	{
	  'nvim-orgmode/orgmode',
	  event = 'VeryLazy',
	  ft = { 'org' },
	  config = function()
	    -- Setup orgmode
	    require('orgmode').setup({
	      org_agenda_files = '~/orgfiles/**/*',
	      org_default_notes_file = '~/orgfiles/refile.org',
	    })

	    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
	    -- add ~org~ to ignore_install
	    -- require('nvim-treesitter.configs').setup({
	    --   ensure_installed = 'all',
	    --   ignore_install = { 'org' },
	    -- })
	  end,
	},
	{
	  "startup-nvim/startup.nvim",
	  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	  config = function()
	    require"startup".setup()
	  end
	},

}
