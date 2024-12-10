return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
{
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "cpp","vim", "python", "c_sharp", "javascript", "html","typescript", "json", "css","tsx", "bash","http"};
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			highlight_groups = {
    ["@function"] = { fg = "#ff79c6" },  -- Adjust color as needed
    -- Highlight method calls like console.log
    ["@method"] = { fg = "#ff79c6" },  -- Adjust color as needed
			}
		})
	end,
}
