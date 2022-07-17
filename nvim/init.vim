set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set nu
set noerrorbells
set nowrap
set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set colorcolumn=90
set signcolumn=yes

" Leetcode plugin configuration
let g:leetcode_browser='chrome'
let g:leetcode_solution_filetype='golang'

colorscheme tokyonight
let g:lightline = {'colorscheme': 'tokyonight'}

" Initialise LUA modules
lua require('lucasclerissepro')
