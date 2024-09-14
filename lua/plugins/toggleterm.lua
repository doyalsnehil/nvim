return {
	"akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 10, -- Size of terminal window (for split)
      open_mapping = [[<C-\>]], -- Keybinding to toggle terminal
      shade_filetypes = {},
      shading_factor = 2,
      direction = 'horizontal', -- Options: 'horizontal', 'vertical', 'tab', 'float'
      float_opts = {
        border = 'curved', -- Border style for floating terminal
      },
    })
  end
}
