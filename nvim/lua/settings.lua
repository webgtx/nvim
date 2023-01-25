local set = vim.opt

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.showtabline=2

set.expandtab = true
set.number = true 

-- Snippets
require("luasnip.loaders.from_snipmate").lazy_load({
  paths = { "./snippets" }
})

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

-- Specific language server configuration

require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = false 
    }
  }
}
