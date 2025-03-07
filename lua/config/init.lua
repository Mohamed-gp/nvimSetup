require("config.lazy")
require("config.remap")
require("config.lsp")
require("config.set")
vim.cmd.colorscheme("catppuccin")
require("colorizer").setup()

local cmp = require("cmp")
vim.keymap.set("i", "<Tab>", function()
	if require("copilot.suggestion").is_visible() then
		require("copilot.suggestion").accept()
	elseif cmp.visible() then
		cmp.select_next_item()
	else
		return "<Tab>"
	end
end, { expr = true, noremap = true, silent = true })
