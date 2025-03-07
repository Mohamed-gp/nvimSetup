return {
	"windwp/nvim-ts-autotag",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true, -- Fermer automatiquement les balises
				enable_rename = true, -- Renommer automatiquement les balises
				enable_close_on_slash = false, -- Ne pas fermer automatiquement quand tu tapes `</`
			},
		})
	end,
}
