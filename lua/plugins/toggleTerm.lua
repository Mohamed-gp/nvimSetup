return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 10,
				direction = "horizontal",
				shade_terminals = true,
				persist_size = true,
				start_in_insert = true,
			})

			local Terminal = require("toggleterm.terminal").Terminal
			local terminals = {}
			local current_term = 1

			-- 📌 Fonction pour créer un nouveau terminal
			function _G.TermNew()
				local id = #terminals + 1
				terminals[id] = Terminal:new({ id = id, direction = "horizontal" })
				current_term = id
				terminals[current_term]:toggle()
			end

			-- 📌 Fonction pour switcher au terminal suivant
			function _G.TermNext()
				if #terminals == 0 then
					return
				end

				-- 📌 Fermer tous les terminaux ouverts avant d'en ouvrir un seul
				for _, term in pairs(terminals) do
					term:close()
				end

				-- 📌 Sélectionner le terminal suivant
				current_term = (current_term % #terminals) + 1
				terminals[current_term]:toggle() -- Ouvre uniquement celui-ci
			end

			-- 📌 Fonction pour ouvrir/fermer le terminal actif
			function _G.TermToggle()
				if terminals[current_term] then
					terminals[current_term]:toggle()
				else
					TermNew() -- Si aucun terminal n'existe, en créer un
				end
			end

			-- 📌 Ajouter des commandes Neovim
			vim.api.nvim_create_user_command("TermNew", "lua TermNew()", {})
			vim.api.nvim_create_user_command("TermNext", "lua TermNext()", {})
			vim.api.nvim_create_user_command("TermToggle", "lua TermToggle()", {})

			-- 📌 Ajouter des raccourcis clavier avec <Leader>
			vim.keymap.set("n", "<Leader>t", "<cmd>TermToggle<CR>", { noremap = true, silent = true }) -- Toggle terminal
			vim.keymap.set("n", "<Leader>l", "<cmd>TermNext<CR>", { noremap = true, silent = true }) -- Switch terminal
			vim.keymap.set("n", "<Leader>n", "<cmd>TermNew<CR>", { noremap = true, silent = true }) -- Nouveau terminal
		end,
	},
}
