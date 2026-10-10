return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { 
			"bashls", 
			-- "pyright", 
			"lua_ls", 
			"basedpyright",
			"rust_analyzer", 
			-- "nextflow_ls",
			"ruff",
			"gopls",
			"r_language_server",
		},
	},
	dependencies = {
		{ 
			"williamboman/mason.nvim", 
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			} 
		},
		{ 
			"neovim/nvim-lspconfig" 
		},
	}
}
