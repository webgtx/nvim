require('settings')
require('packages')
require('colorscheme')
require('lualine').setup()
require("mason").setup()
require("mason-lspconfig").setup()
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()
