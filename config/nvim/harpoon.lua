return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  -- event = "VeryLazy",
  config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup({
			menu = {
        width = vim.api.nvim_win_get_width(0) - 20,
      }
		})
		-- REQUIRED

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
		vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
		vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
		vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)


		-- basic telescope configuration
		-- local conf = require("telescope.config").values
		-- local function toggle_telescope(harpoon_files)
		-- 		local file_paths = {}
		-- 		for _, item in ipairs(harpoon_files.items) do
		-- 				table.insert(file_paths, item.value)
		-- 		end
		--
		-- 		require("telescope.pickers").new({}, {
		-- 				prompt_title = "Harpoon buffers",
		-- 				finder = require("telescope.finders").new_table({
		-- 						results = file_paths,
		-- 				}),
		-- 				previewer = conf.file_previewer({}),
		-- 				sorter = conf.generic_sorter({}),
		-- 		}):find()
		-- end

		-- local harpoon_mark = require("harpoon.mark")
		-- local harpoon_ui = require("harpoon.ui")
		-- vim.keymap.set("n", "<leader>m", function() harpoon_mark.add_file() end)
		-- vim.keymap.set("n", "<leader>a", function() harpoon_ui.toggle_quick_menu() end)
		-- for i = 1, 9 do
		--   vim.keymap.set("n", "<leader>" .. i, function() harpoon_ui.nav_file(i) end)
		-- end

		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
		vim.keymap.set("n", "<leader-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
		-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
		-- 		{ desc = "Open harpoon window" })

  end,
  -- keys = {
  --   { "<leader>a", function() require("harpoon"):list():add() end, desc = "Add file to Harpoon" },
  --   { "<leader>m", function() require("harpoon.ui").toggle_quick_menu(require("harpoon"):list()) end, desc = "Toggle Harpoon menu" },
  --   { "<C-e>", function() require("harpoon.ui").nav_next() end, desc = "Next Harpoon file" },
  --   { "<C-q>", function() require("harpoon.ui").nav_prev() end, desc = "Previous Harpoon file" },
  --   { "<leader>1", function() require("harpoon.ui").nav_file(1) end, desc = "Go to Harpoon file 1" },
  --   { "<leader>2", function() require("harpoon.ui").nav_file(2) end, desc = "Go to Harpoon file 2" },
  --   { "<leader>3", function() require("harpoon.ui").nav_file(3) end, desc = "Go to Harpoon file 3" },
  --   { "<leader>4", function() require("harpoon.ui").nav_file(4) end, desc = "Go to Harpoon file 4" },
  --   { "<leader>5", function() require("harpoon.ui").nav_file(5) end, desc = "Go to Harpoon file 5" },
  -- },
}

