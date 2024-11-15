return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("solarized-osaka").setup({
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style.
      hide_inactive_statusline = false, -- Hide inactive statuslines with a thin border
      dim_inactive = false, -- Dims inactive windows
      lualine_bold = false, -- Section headers in the lualine theme will be bold if true

      -- Override specific color groups
      on_colors = function(colors)
        -- You can adjust colors here if needed
      end,

      -- Override specific highlights
      on_highlights = function(highlights, colors)
        -- You can adjust highlights here if needed
      end,
    })
  end,
}

