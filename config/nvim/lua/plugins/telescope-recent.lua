return {
	"smartpde/telescope-recent-files",
	lazy = true,
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("telescope").load_extension("recent_files")
	end,
	keys = {
		{
			"<leader>fr",
			function()
				require("telescope").extensions.recent_files.pick()
			end,
			desc = "Telescope [f]ind [r]ecent (enhanced)",
		}
	}
}
