return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				-- Automatically install language servers configured in lspconfig
				automatic_installation = true,
			})

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Example: pyright configuration
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})


			lspconfig.eslint.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- Additional configuration (if needed)
					-- client.resolved_capabilities.document_formatting = false
				end,
			})

			-- Example: lua_ls configuration
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- Add more LSP server configurations here as needed
		end,
	},
}
