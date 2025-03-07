vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- i dont want to go to the explorer with :Ex everytime
-- telescope keymaps
local builtin = require("telescope.builtin")

-- Function to search for files while excluding node_modules and .git
local function find_files_filtered()
	builtin.find_files({
		find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" },
	})
end

-- Function to search for all files without any exclusions
local function find_files_all()
	builtin.find_files()
end

-- Quick file search (excluding node_modules and .git)
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })

-- Full file search (all files)
vim.keymap.set("n", "<leader>fa", find_files_all, { desc = "Telescope Find All Files" })

-- Live grep in the project, excluding node_modules and .git
vim.keymap.set("n", "<leader>fg", function()
	builtin.live_grep({
		additional_args = function()
			return { "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" }
		end,
	})
end, { desc = "Telescope Live Grep (filtered)" })
-- Neotree
vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "H", "^", { noremap = true }) -- Aller au début de la ligne
vim.keymap.set("n", "L", "$", { noremap = true }) -- Aller à la fin de la ligne
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true }) -- Descendre de moitié et centrer
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true }) -- Monter de moitié et centrer
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true }) -- Déplacer une ligne vers le bas
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true }) -- Déplacer une ligne vers le haut
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) -- Déplacer une sélection vers le bas
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) -- Déplacer une sélection vers le haut

-- copier
-- Copier avec Ctrl+C (en Mode Normal et Visuel)
vim.keymap.set({ "n", "v" }, "<C-c>", '"+y', { noremap = true, silent = true })

-- Coller avec Ctrl+V (en Mode Insertion et Normal)
vim.keymap.set({ "i", "n" }, "<C-v>", '"+p', { noremap = true, silent = true })

-- terminal
-- 📌 Toggle du terminal avec <Leader>j (fonctionne en mode normal ET terminal)
vim.keymap.set({ "n", "t" }, "<Leader>j", "<cmd>TermToggle<CR>", { noremap = true, silent = true })

-- 📌 Switch au terminal suivant avec <Leader>t (fonctionne en mode normal ET terminal)
vim.keymap.set({ "n", "t" }, "<Leader>t", "<cmd>TermNext<CR>", { noremap = true, silent = true })

-- 📌 Créer un nouveau terminal avec <Leader>n (fonctionne en mode normal ET terminal)
vim.keymap.set({ "n", "t" }, "<Leader>n", "<cmd>TermNew<CR>", { noremap = true, silent = true })

-- 📌 Sortir du mode terminal facilement avec <Esc>
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
