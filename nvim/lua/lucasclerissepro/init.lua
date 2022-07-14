local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer3.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

function CreateNoremapGlobal(type, opts)
  return function(lhs, rhs)
    vim.api.nvim_set_keymap(type, lhs, rhs, opts)
  end
end

function CreateNoremap(type, opts)
  return function(lhs, rhs, bufnr)
    bufnr = bufnr or 0
    vim.api.nvim_buf_set_keymap(bufnr, type, lhs, rhs, opts)
  end
end

Nnoremap = CreateNoremap("n", { noremap = true })
Inoremap = CreateNoremap("i", { noremap = true })

require("lucasclerissepro.lsp")
require("lucasclerissepro.git")
require("lucasclerissepro.lualine")
require("lucasclerissepro.treesitter")

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'google/vim-jsonnet'
  use 'L3MON4D3/LuaSnip'
  use 'gpanders/editorconfig.nvim'
  use 'ThePrimeagen/harpoon'
  use 'folke/tokyonight.nvim'
  use 'neovim/nvim-lspconfig'
  use 'ianding1/leetcode.vim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'mfussenegger/nvim-dap'
  use 'lukas-reineke/lsp-format.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'ThePrimeagen/git-worktree.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'tpope/vim-fugitive'
  use 'jiangmiao/auto-pairs'

  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({})
    end
  }

  use 'github/copilot.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
