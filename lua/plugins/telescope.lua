return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                layout_strategy = "horizontal", -- Disposition horizontale
                layout_config = {
                    preview_width = 0.5, -- La preview occupe 50% de la largeur
                    width = 0.9, -- Utilisation de 90% de l'écran
                    height = 0.8, -- Utilisation de 80% de l'écran
                    prompt_position = "top", -- Mettre la barre de recherche en haut
                },
                sorting_strategy = "ascending", -- Résultats du haut vers le bas
            },
        })

        -- Charge l'extension fzf si disponible
        pcall(telescope.load_extension, "fzf")
    end
}

