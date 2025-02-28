return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "auto", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = true, -- désactive la couleur de fond
            show_end_of_buffer = false, -- affiche les '~' après la fin du buffer
            term_colors = false, -- applique les couleurs au terminal
            dim_inactive = {
                enabled = false, -- assombrit les fenêtres inactives
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false, -- forcer aucun italique
            no_bold = false, -- forcer aucun gras
            no_underline = false, -- forcer aucun soulignement
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            color_overrides = {},
            custom_highlights = {},
            default_integrations = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
            },
        })

        -- Appliquer le thème
        vim.cmd.colorscheme "catppuccin"
    end,
}

