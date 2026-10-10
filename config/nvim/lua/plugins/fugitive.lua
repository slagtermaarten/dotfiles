return {
  "tpope/vim-fugitive",
	cmd = { "Git", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "Glog", "Gclog", "Gmove", "Gdelete", "Gbrowse" },
	keys = {
		{ "<leader>gs", function() vim.cmd("tab Git") end, desc = "Open Git status in new tab", mode = "n" },
		{ "<leader>gl", function() vim.cmd("tab Git log") end, desc = "Open Git commit log in new tab", mode = "n" },
		{ "<leader>gv", function() vim.cmd("tab Git show") end, desc = "Open Git show in new tab", mode = "n" },
		{ "<leader>gc", ":tab Git commit -m ", desc = "Git commit in new tab", mode = "n" },
		{ "<leader>gd", function() vim.cmd("tab Gvdiffsplit") end, desc = "Open Git diff split in new tab", mode = "n" },
		{ "<leader>dp", ":diffput<CR>", desc = "Diff put", mode = "v" },
		{ "<leader>gw", function() vim.cmd("Gwrite") end, desc = "Write changes to Git", mode = "n" },
		{ "<leader>gr", function() vim.cmd("Gread") end, desc = "Read changes from Git", mode = "n" },
		{ "<leader>gb", function() vim.cmd("Gbrowse") end, desc = "Open current file in GitHub", mode = "n" },
		{ "<leader>gm", function() vim.cmd("Gmove") end, desc = "Move file in Git", mode = "n" },
		{ "<leader>gD", function() vim.cmd("Gdelete") end, desc = "Delete file in Git", mode = "n" },
	},
  init = function()
    vim.cmd([[
      cabbrev Git tab Git
      cabbrev G tab G
    ]])
  end,
  event = "VeryLazy",
}
