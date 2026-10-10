return {
	{ 
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		init = function()
			if vim.fn.argc(-1) == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree").setup({
						filesystem = {
							hijack_netrw_behavior = "open_current",
						},
					})
				end
			end
		end,
		-- config = function()
		-- 	local builtin = require('neo-tree.builtin')
		-- 	vim.keymap.set('n', '<leader>t', builtin.toggle, { desc = 'NeoTree [t]oggle' })
		-- end,
		-- keys = {
		-- 	{ '<leader>tt', 'Neotree toggle', desc = 'NeoTree [t]oggle' },
		-- }
	}
}
