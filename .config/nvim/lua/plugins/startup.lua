return {
  "goolord/alpha-nvim",
  config = function()
    --require('alpha').setup(require('alpha.themes.dashboard').config)
	local alpha = require('alpha')
	local dashboard = require('alpha.themes.dashboard')

	-- Set a header (ASCII art or a message)
	dashboard.section.header.val = {
		[[ ██████╗ ██████╗ ██████╗ ███████╗   ███████╗███████╗███╗   ██╗]],
		[[██╔════╝██╔═══██╗██╔══██╗██╔════╝   ╚══███╔╝██╔════╝████╗  ██║]],
		[[██║     ██║   ██║██║  ██║█████╗█████╗ ███╔╝ █████╗  ██╔██╗ ██║]],
		[[██║     ██║   ██║██║  ██║██╔══╝╚════╝███╔╝  ██╔══╝  ██║╚██╗██║]],
		[[╚██████╗╚██████╔╝██████╔╝███████╗   ███████╗███████╗██║ ╚████║]],
		[[ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝   ╚══════╝╚══════╝╚═╝  ╚═══╝]]
	}

	-- Set menu options
	dashboard.section.buttons.val = {
	  dashboard.button("e", "  New file" , ":ene <BAR> startinsert <CR>"),
	  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
	  dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
	  dashboard.button("q", "  Quit", ":qa<CR>"),
	  dashboard.button("?", "  Help", ":Telescope help_tags<CR>")
	}

	local quotes = {
	  "The only way to do great work is to love what you do.",
	  "Stay hungry, stay foolish.",
	  "Good artists copy, great artists steal.",
	  "Code is like humor. When you have to explain it, it’s bad."
	}

	dashboard.section.footer.val = "Welcome to Neovim\n" .. quotes[math.random(#quotes)]

	-- Set up the dashboard
	alpha.setup(dashboard.config)

  end
}

