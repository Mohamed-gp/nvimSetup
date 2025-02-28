-- 📌 Activer la colonne des signes pour afficher les erreurs LSP
vim.opt.signcolumn = 'yes'
-- 
-- 📌 Ajouter cmp_nvim_lsp pour gérer les capacités des LSP
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- 📌 Attacher les raccourcis aux LSP actifs
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts) -- Documentation
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts) -- Aller à la définition
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts) -- Aller à la déclaration
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts) -- Voir les implémentations
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts) -- Voir la définition du type
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts) -- Trouver les références
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts) -- Signature des fonctions
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts) -- Renommer une variable
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts) -- Formater le fichier
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts) -- Actions LSP
  end,
})

-- 📌 Intégrer `mason.nvim` pour gérer les serveurs LSP facilement
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",      -- Lua
    "pyright",     -- Python
    "html",        -- HTML
    "cssls",       -- CSS
    "jsonls",      -- JSON
    "bashls",      -- Bash
  },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
  },
})

-- 📌 Configuration de nvim-cmp (autocomplétion)
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'},
    {name = 'path'},
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body) -- Requiert Neovim v0.10+
    end,
  },
  mapping = cmp.mapping.preset.insert({
	     ['<C-Space>'] = cmp.mapping.complete(), -- Ouvrir la complétion avec Ctrl+Espace
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accepter avec Enter (comme VS Code)
    ['<Tab>'] = cmp.mapping.select_next_item(), -- Aller à la suggestion suivante
    ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- Aller à la suggestion précédente

  }),
})
