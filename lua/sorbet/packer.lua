vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
use { "ellisonleao/gruvbox.nvim" }
use 'Yazeed1s/minimal.nvim'
use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }
use('nvim-treesitter/nvim-treesitter', {run = ':tsupdate'})
use {
  'vonheikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
	  {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'l3mon4d3/luasnip'},
  }
}
use {'theprimeagen/harpoon'}

end)
