local config = function()
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

    -- C/C++
    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })


    -- golang
    lspconfig.gopls.setup({
        cmd = {"gopls", "serve"},
        filetypes = {"go", "gomod"},

        capabilities = capabilities,
        on_attach = on_attach,
    })


	-- bash
	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "sh" },
	})

    local luacheck = require("efmls-configs.linters.luacheck")
	local flake8 = require("efmls-configs.linters.flake8")
	local shellcheck = require("efmls-configs.linters.shellcheck")
    local golangci_lint = require("efmls-configs.linters.golangci_lint")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
            "cpp",
            "c",
            "go",
			"sh",
		},

		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck },
				python = { flake8 },
				sh = { shellcheck },
                cpp = {
                    clangd = {
                        command = "C:\\msys64\\clang64\\bin\\clangd.exe",
                        filetypes = {"c", "cpp"}
                    },
                    clang_tidy = {
                    lintCommand = "C:\\msys64\\clang64\\bin\\clang-tidy.exe",
                    lintFormats = { "%f:%l:%c: %m" },
                    lintStdin = true,
                    lintSource = "clang-tidy",
                    lintIgnoreExitCode = true,
                    },
                },
                c = {
                    clangd = {
                        command = "C:\\msys64\\clang64\\bin\\clangd.exe",
                        filetypes = {"c", "cpp"}
                    },
                    clang_tidy = {
                    lintCommand = "C:\\msys64\\clang64\\bin\\clang-tidy.exe",
                    lintFormats = { "%f:%l:%c: %m" },
                    lintStdin = true,
                    lintSource = "clang-tidy",
                    lintIgnoreExitCode = true,
                    },
                },
                go = { golangci_lint },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
