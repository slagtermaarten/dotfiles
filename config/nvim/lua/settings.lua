vim.opt.number = true							 -- Show line numbers

vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

vim.cmd [[
	augroup FileTypeSettings
		autocmd!
		autocmd BufRead,BufNewFile *.nf.test set filetype=nextflow
	augroup END
]]
