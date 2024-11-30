-- ~/.config/nvim/lua/plugins/catppuccin.lua

return {
  "catppuccin/nvim",
  as = "catppuccin",
  config = function()
	  Lazy = true
    -- Catppuccin setup
    require("catppuccin").setup({
      transparent_background = true, -- Enable transparency
      term_colors = true,
      integrations = {
        neotree = true, -- Ensure NeoTree matches the colorscheme
        -- Add other integrations as needed
      },
    })

    -- Apply the colorscheme
--    vim.cmd [[colorscheme catppuccin]]
  end
}

