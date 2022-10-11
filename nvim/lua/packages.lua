vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'navarasu/onedark.nvim'
  use 'williamboman/mason.nvim' 
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  } 
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)
