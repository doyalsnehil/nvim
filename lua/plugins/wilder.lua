return {
	{
		"gelguy/wilder.nvim",
		lazy = true,
		event = 'CmdlineEnter',
		dependencies = {
			"romgrk/fzy-lua-native", -- Optional: for fuzzy matching
		},
		config = function()
			local wilder = require("wilder")
			wilder.setup({ modes = { ":", "/", "?" } }) -- Enable for command line and search

			-- Use popupmenu for a better UI
			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
					border = "rounded",
					highlighter = wilder.basic_highlighter(),
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
				}))
			)

			-- Use fuzzy matching with fzy-lua-native for better results
			wilder.set_option("pipeline", {
				wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
			})
		end,
	},
}
