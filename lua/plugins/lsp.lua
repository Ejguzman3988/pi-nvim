return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					-- see the configuration section for more details
					-- Load luvit types when the vim.uv word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local config = require("lspconfig")
			config.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							maxPreload = 1000,
							preloadFileSize = 150,
						},
						diagnostics = {
							globals = { "vim" },
						},
						telemetry = { enable = false },
					},
				},
			})

			-- Ruby Lsp Setup
			config.ruby_lsp.setup({
				capabilities = capabilities,
				init_options = {
					formatter = "standard",
					linters = { "standard" },
				},
				addonSettings = {
					["Ruby LSP Rails"] = {
						enablePendingMigrationsPrompt = false,
					},
				},

				-- settings = {
				-- 	rubyLsp = {
				-- 		enabledFeatures = {
				-- 			"diagnostics",
				-- 			"formatting",
				-- 			"codeActions",
				-- 			"hover",
				-- 			"completion",
				-- 			"foldingRanges",
				-- 			"documentHighlights",
				-- 			"documentSymbols",
				-- 			"semanticHighlighting",
				-- 		},
				-- 		diagnostics = {
				-- 			enabled = true,
				-- 		},
				-- 		linters = {
				-- 			rubocop = {
				-- 				command = "rubocop",
				-- 				enabled = true,
				-- 			},
				-- 		},
				-- 	},
				-- },
			})

			-- Lua LSP setup
			config.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							maxPreload = 1000,
							preloadFileSize = 150,
						},
						diagnostics = {
							globals = { "vim" },
						},
						telemetry = { enable = false },
					},
				},
			})

			-- Python LSP setup
			config.pyright.setup({
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnoticsMode = "workspace",
							useLibraryCodeForTypes = true,
						},
					},
				},
			})

			-- Javascript/TypeScript LSP setup (includes React)
			config.ts_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
				init_options = {
					preferences = {
						disableSuggestions = false,
					},
				},
			})

			-- Go LSP setup
			config.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			})

			-- HTML LSP Setup
			config.html.setup({
				capabilities = capabilities,
				filetypes = { "html" },
			})

			-- CSS LSP Setup
			config.cssls.setup({
				capabilities = capabilities,
				filetypes = { "css", "scss", "less" },
			})

			config.marksman.setup({
				capabilities = capabilities,
			})

			vim.diagnostic.config({
				virtual_text = true, -- Show diagnostics inline
				signs = true, -- Keep signs in the sign column
				underline = true, -- Underline problematic code
				update_in_insert = false, -- Avoid updates while typing
			})

			-- Format on save via LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end

					-- Setup LSP keymaps on attach
					local bufnr = args.buf
					local optionsFunc = function(desc)
						return { buffer = bufnr, desc = desc }
					end
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, optionsFunc("Go to Definition"))
					vim.keymap.set("n", "K", vim.lsp.buf.hover, optionsFunc("Hover over to open description"))
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, optionsFunc("Code actions"))
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, optionsFunc("Rename"))
					vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, optionsFunc("references"))

					-- Format on save if the client supports it
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
							end,
						})
					end
				end,
			})

			-- Add convenient keymaps for diagnostics
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics in quickfix" })
		end,
	},
}
