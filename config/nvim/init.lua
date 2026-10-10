vim.env.PATH = "/home/maartens/lib/go/bin:" .. vim.env.PATH
require("config.lazy")
require("lazy").load({ plugins = { "nvim-lspconfig" } })
require("keymaps")
require("lsp")
require("autocommands")
require("settings")
