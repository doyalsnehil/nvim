return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for icons
			event = "BufWinEnter",
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "none", -- No buffer numbers
				close_command = "bdelete! %d", -- Command to close buffer
				right_mouse_command = "bdelete! %d", -- Close buffer with right-click
				show_buffer_close_icons = true, -- Show close icons on each buffer
				separator_style = "slant", -- You can use 'thin', 'slant', or 'padded'
				diagnostics = "nvim_lsp", -- Integrates with LSP diagnostics
				offsets = {
					{ filetype = "NvimTree", text = "File Explorer", padding = 1 },
				},
			},
		})
	end,
}
