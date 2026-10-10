-- Set filetype to nextflow for .nf files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
		pattern = {"*.nf", "*.config"},
		callback = function()
				vim.bo.filetype = "nextflow"
		end,
})

-- -- Set filetype to R for .R files
-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
-- 		pattern = {"*.R"},
-- 		callback = function()
-- 				vim.bo.filetype = "R"
-- 		end,
-- })

vim.api.nvim_create_autocmd({'BufWinEnter'}, {
  desc = 'return cursor to where it was last time closing the file',
  pattern = '*',
  command = 'silent! normal! g`"zv',
})
