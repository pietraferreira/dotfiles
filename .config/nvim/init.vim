" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sainnhe/edge'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vimwiki/vimwiki'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'

" COC stuff
" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc

call plug#end()

" My settings
let mapleader=","
set encoding=utf-8
set visualbell
set ruler
syntax on
set number                  " line numbers
set autoread                " automatically reload files changed outside of Vim

set nowrap
set textwidth=80
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set incsearch               " match as i type
set ignorecase
set smartcase
set showmatch               " when bracket is inserted, jump to matching

set noerrorbells
set smartindent
set noswapfile
set termguicolors           " enables 24bit RGB colors in the TUI 
set scrolloff=8             " start scrolling 8 before the end of page
set guicursor=              " dont have the ugly insert cursor
set nohlsearch              " dont keep search highlighted please
set colorcolumn=80          " little column so i know the limit

set formatoptions-=ro       " for example if i make a comment, dont make the
                            " next line a comment too
colorscheme edge

" For nerdcommenter
filetype plugin on

" My mappings :)
" Telescope stuff
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Activate nerd tree
map <C-m> :NERDTreeToggle<CR>

nnoremap <C-[> :tabprevious<CR>
nnoremap <C-]> :tabnext<CR>

" Activate COQ
map <C-c> :COQnow --shut-up<CR>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" turn numbers on
nnoremap <leader>N :setlocal number!<cr>

" replace the last word searched with whatever
nnoremap <leader>r :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>:%s//

" Pandoc shortcuts
" MD -> PDF
nnoremap <leader>pp :!pandoc %:p --template eisvogel.latex --highlight-style pygments -o ~/Documents/VimWiki/personal.wiki/pdf/%:t:r.pdf

" MD -> HTML
nnoremap <leader>ph :!pandoc -f gfm %:p --to=html5 -s --highlight-style pygments -o ~/Documents/VimWiki/personal.wiki/html/%:t:r.html

" i honestly dont know what this is
let g:neomake_python_enabled_makers = ['pylint']
" call neomake#configure#automake('nrwi', 500)

" cool theme
let g:airline_theme='fruit_punch'

" vimwiki stuff "
" Run multiple wikis "
let g:vimwiki_list = [
                        \{'path': '~/Documents/VimWiki/personal.wiki',
                         \ 'syntax': 'markdown', 'ext': '.md'}]
