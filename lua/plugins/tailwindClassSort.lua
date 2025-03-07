return {
	"laytan/tailwind-sorter.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("tailwind-sorter").setup()
	end,
}
