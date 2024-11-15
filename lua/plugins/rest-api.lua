return {
	{
		"rest-nvim/rest.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rest-nvim").setup({
				-- Optional configuration settings can go here
			})
		end,
	},
}
