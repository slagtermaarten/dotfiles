-- Create a command to format the current buffer using ruff_lsp
vim.api.nvim_create_user_command('RuffFormat', function()
  vim.lsp.buf.format({ name = "ruff" })
end, { desc = "Format current file with ruff" })

-- Map <leader>rf to the RuffFormat command
vim.keymap.set('n', '<leader>rf', '<cmd>RuffFormat<cr>', { buffer = true, desc = '[R]uff [F]ormat' })
