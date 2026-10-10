return {
	'nvim-mini/mini.nvim',
	version = '*',
	config = function()
		require('mini.comment').setup()
		require('mini.surround').setup()
		require('mini.indentscope').setup()
		require('mini.bracketed').setup()
		require('mini.statusline').setup({
			use_icons = true
		})
		require('mini.trailspace').setup()
	end,
	keys = {
		{ 'ts', '<cmd>lua require("mini.trailspace").trim()<CR>', desc = 'Trim trailing spaces' }
	},
}
