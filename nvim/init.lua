--if we use custom file for everything use require('file name')
--set the leader key to space to execute the command followed by leader key
vim.cmd("let mapleader = ' '")

require("preferences")
require("keymaps")
-- Step 1: this is installation setup for lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable", -- latest stable release
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Step 2: Configure Lazy.nvim to manage plugins
require("lazy").setup({
	ui = {
		border = "double",

	},

	spec = {
		{ import = "plugins" }, -- Ensure this file exists
	},
})

-- Adding the colorscheme ( if you want to change the theme just change the name e.g. default,nord,catppuccin,retrobox
vim.cmd("colorscheme monokai-pro")

-- Setting the background transparent or same as the terminal
vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight NonText guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight LineNr guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight CursorLine guibg=NONE]])
vim.cmd([[highlight SignColumn guibg=NONE]])


vim.cmd([[
    hi NormalNC guibg=NONE ctermbg=NONE
    hi VertSplit guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
    hi MsgArea guibg=NONE ctermbg=NONE
    hi TelescopeNormal guibg=NONE ctermbg=NONE
    hi TelescopeBorder guibg=NONE ctermbg=NONE
    hi TelescopePromptBorder guibg=NONE ctermbg=NONE
    hi TelescopeResultsBorder guibg=NONE ctermbg=NONE
    hi TelescopePreviewBorder guibg=NONE ctermbg=NONE
    hi NormalFloat guibg=NONE ctermbg=NONE
    hi FloatBorder guibg=NONE ctermbg=NONE

	  hi TelescopePromptNormal guibg=NONE ctermbg=NONE
    hi TelescopeResultsNormal guibg=NONE ctermbg=NONE
    hi TelescopePreviewNormal guibg=NONE ctermbg=NONE

]])

