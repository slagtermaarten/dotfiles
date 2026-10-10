vim.lsp.enable('rust_analyzer', {
   settings = {
       ["rust-analyzer"] = {
           cargo = { allFeatures = true },
           procMacro = { enable = true },
       },
   }
})

vim.lsp.enable('nextflow', {
  cmd = { 'java', '-jar', vim.fn.expand "~/bin/language-server-all.jar" },
  filetypes = { 'nextflow', 'nf', 'groovy', 'config' },
  root_markers = { 'nextflow.config', '.git' },
  settings = {
    nextflow = {
      files = {
        exclude = { '.git', '.nf-test', 'work' },
      }
    }
  }
})

vim.lsp.enable("ruff", {
	settings = {
		ruff = {
			-- Example setting: specify the path to the ruff executable
			executablePath = "~/.local/bin/ruff",
			-- Example setting: enable specific rules
			rules = {
				"F401", -- unused imports
				"E501", -- line too long
			},
		},
	},
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("bashls")

vim.lsp.enable('basedpyright', {
	settings = {
		basedpyright = {
			disableOrganizeImports = false,
			analysis = {
				typeCheckingMode = "strict", -- or "basic", "off"
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
})

vim.lsp.enable("gopls", {
    settings = {
				analyses = {
						unusedparams = true,
						staticcheck = true,
						gofumpt = true,
				},
    },
})

vim.lsp.enable("r_language_server")
