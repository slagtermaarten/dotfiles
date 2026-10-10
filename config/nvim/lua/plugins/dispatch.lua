return {
	"tpope/vim-dispatch",
	cmd = { "Dispatch", "Make", "Focus", "Start", "Spawn"},
	keys = {
		{ "<leader>d", function() vim.cmd("Dispatch") end, desc = "Run Dispatch", mode = "n" },
	},
}
