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
			capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			)
			capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
			-- TypeScript/JavaScript LSP Optimization
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- Disable semantic tokens to improve speed
					--[[ if client.server_capabilities.semanticTokensProvider then
						client.server_capabilities.semanticTokensProvider = nil
					end ]]
				end,
				flags = {
					debounce_text_changes = 150, -- Reduce frequent updates to improve performance
				},
			})

			-- Disable inline hints but keep error/warning signs
			vim.diagnostic.config({
				virtual_text = false, -- Removes inline hints to reduce noise
				signs = true, -- Keeps error/warning signs in the gutter
				underline = true, -- Keeps underlines for errors
				update_in_insert = false, -- Improves performance by not updating diagnostics while typing
			})

			-- Other LSP configurations remain untouched
			lspconfig.clangd.setup({
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
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
			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					pyright = {
						disableOrganizeImports = true, -- Let Ruff handle import sorting
					},
					python = {
						analysis = {
							ignore = { "*" }, -- Ignore Pyright linting (use Ruff instead)
						},
					},
				},
			})

			lspconfig.ruff.setup({
				capabilities = capabilities,
				filetypes = { "python" },
				on_attach = function(client, bufnr)
					client.server_capabilities.hoverProvider = false -- Disable Ruff hover (Pyright handles it)
				end,
			})
			-- Configure Emmet-LS

			lspconfig.emmet_language_server.setup({
				filetypes = {
					"html",
					"css",
					"scss",
					"javascriptreact",
					"typescriptreact",
					"vue",
					"svelte",
					"xml",
					"pug",
				}, -- Add more filetypes if needed
				init_options = {
					--- Emmet options can go here
					html = {
						options = {
							["bem.enabled"] = true, -- Enable BEM-style abbreviations
						},
					},
				},
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
