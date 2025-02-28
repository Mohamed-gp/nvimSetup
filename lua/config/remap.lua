vim.g.mapleader = " "

vim.keymap.set("n","<leader>pv",vim.cmd.Ex) -- i dont want to go to the explorer with :Ex everytime
-- telescope keymaps
local builtin = require("telescope.builtin")

-- Function to search for files while excluding node_modules and .git
local function find_files_filtered()
  builtin.find_files({
    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" }
  })
end

-- Function to search for all files without any exclusions
local function find_files_all()
  builtin.find_files()
end

-- Quick file search (excluding node_modules and .git)
vim.keymap.set("n", "<C-p>", find_files_filtered, { desc = "Telescope Find Files (filtered)" })

-- Full file search (all files)
vim.keymap.set("n", "<leader>fa", find_files_all, { desc = "Telescope Find All Files" })

-- Live grep in the project, excluding node_modules and .git
vim.keymap.set("n", "<C-f>", function()
  builtin.live_grep({
    additional_args = function() return { "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" } end
  })
end, { desc = "Telescope Live Grep (filtered)" })

