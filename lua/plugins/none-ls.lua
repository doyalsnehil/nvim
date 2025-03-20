return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Explicit filetype restriction for formatters
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "html", "css", "javascript", "typescript", "json", "markdown" },
				}),
				null_ls.builtins.formatting.stylua.with({
					filetypes = { "lua" }, -- Ensures it runs only for Lua
				}),
				null_ls.builtins.formatting.clang_format.with({
					filetypes = { "c", "cpp", "objc", "objcpp" }, -- Ensures it's scoped correctly
					command = vim.fn.stdpath("data") .. "/mason/bin/clang-format", -- Uses Mason-installed clang-format
					extra_args = { "--style=file" }, -- Automatically detects project-specific or global .clang-format
				}),
			},
		})
	end,
}
