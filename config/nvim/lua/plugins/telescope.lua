return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("telescope").setup {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
        mappings = {
          i = {
            ["<C-u>"] = false, -- Disable default behavior for Ctrl+U
            ["<C-d>"] = false, -- Disable default behavior for Ctrl+D
						['<c-d>'] = require('telescope.actions').delete_buffer
          },
          n = {
						['<c-d>'] = require('telescope.actions').delete_buffer
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true, -- Show hidden files
        },
      },
    }

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Telescope [f]ind [b]uffers' })
		vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Telescope [f]ind [f]iles' })
		vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>tr', builtin.oldfiles, { desc = 'Telescope [t]est [r]ecent (built-in)' })
		vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = 'Telescope help tags' })
  end,
}
