return {
   { "neovim/nvim-lspconfig" },  -- LSP configuration
   { "simrat39/rust-tools.nvim" },  -- Rust tools
   { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "rust" } } },  -- Syntax highlighting
}
