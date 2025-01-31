call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'zhou13/vim-easyescape'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'marko-cerovac/material.nvim'
Plug 'dstein64/nvim-scrollview'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'd': 'make install_jsregexp'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'prabirshrestha/vim-lsp'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'pbrisbin/vim-mkdir'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lualine/lualine.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'Diogo-ss/42-header.nvim'

call plug#end()

let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100

cnoremap jk <ESC>
cnoremap kj <ESC>

set cc=80
set signcolumn=yes      
set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=4
set expandtab
set shiftwidth=4
set number
syntax on 
filetype plugin indent on

map <ScrollWheelUp> <C-B>
map <ScrollWheelDown> <C-F>

colorscheme gruvbox-material

lua require("config")
