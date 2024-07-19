return {
	{
	  "startup-nvim/startup.nvim",
	  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	  config = function()
	    require"startup".setup()
	  end,

	  section_1 = "test",

	  parts = {"section_1"}
	},

}
