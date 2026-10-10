-- Maarten functions
local function open_git_root()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if git_root and git_root ~= "" then
    vim.cmd("Neotree " .. git_root)
  else
    vim.notify("Not in a git repository", vim.log.levels.INFO)
  end
end
vim.keymap.set("n", "<leader>tgr", open_git_root, { desc = "Open [T]ree [G]it [R]oot" })

-- // Show filename with respect to current working directory
-- local function show_relative_filename()
-- 	local current_file = vim.fn.expand("%:p")
-- 	local cwd = vim.fn.getcwd()
-- 	if current_file and current_file ~= "" then
-- 		local relative_path = vim.fn.fnamemodify(current_file, ":~:.")
-- 		vim.notify("Current file: " .. relative_path, vim.log.levels.INFO)
-- 	else
-- 		vim.notify("No file currently open", vim.log.levels.WARN)
-- 	end
-- end

local function cd_git_root()
  local subproject = vim.fn.findfile(".subproject", ".;")
  if subproject ~= "" then
    vim.print(".subproject file found, staying in current directory.")
    return
  end

  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	vim.print("Git root: " .. tostring(git_root))

  if git_root and git_root ~= "" then
    vim.cmd("cd " .. git_root)
    vim.print("Changed directory to: " .. git_root)
  else
    vim.print ("Not in a git repository", vim.log.levels.WARN)
  end
end
vim.keymap.set("n", "<leader>pr", cd_git_root, { desc = "Change directory to [P]roject [R]oot" })

local function find_current_file()
  local current_file = vim.fn.expand("%:p")
  if current_file and current_file ~= "" then
    vim.cmd(":e " .. current_file)
  else
    vim.notify("No file currently open", vim.log.levels.WARN)
  end
end
vim.keymap.set("n", "<leader>cf", find_current_file, { desc = "Show [C]urrent [F]ile" })
vim.keymap.set("n", "<leader>tt", "Neotree toggle", { desc = "NeoTree [t]oggle" })

-- LSP keymap bindings
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [D]efinition' })
vim.keymap.set('n', '<leader>q', vim.cmd.quit, { desc = 'Quit Neovim' })
vim.keymap.set('n', '<leader>bd', vim.cmd.bdelete, { desc = 'Close Buffer' })
vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = '[G]o to [I]mplementation' })
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'Find [R]eferences' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]ename [S]ymbol' })

vim.keymap.set('v', '<C-s>', 'y:let @/ = @"<CR>', { desc = 'Search and replace selection' })

-- vim.keymap.set("n", "<leader>d", function()
--   vim.diagnostic.open_float(0, { scope = 'line' })
-- end)

vim.keymap.set("n", "<leader>w", ":w!<CR>", { desc = "[W]rite file" })
vim.keymap.set("n", "<leader>el", ":e %:p:h/", { desc = "[E]dit current [L]ocation" })

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.keymap.set("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>', { desc = "[R]eplace selected text" })
