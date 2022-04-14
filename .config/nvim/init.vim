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
"Plug 'neovim/nvim-lspconfig'
Plug 'vimwiki/vimwiki'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'

" COC stuff
" main one
"Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
"" 9000+ Snippets
"Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

"" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
"" Need to **configure separately**

"Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Require plugin configs (lua)
"lua require('hanato')

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
" CoC stuff 
set updatetime=300
set shortmess+=c

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

colorscheme edge

" For nerdcommenter
filetype plugin on

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" My mappings :)
" Telescope stuff
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Activate nerd tree
map <C-m> :NERDTreeToggle<CR>

" Tabs
nnoremap <C-[> :tabprevious<CR>
nnoremap <C-]> :tabnext<CR>

" Activate COQ
"map <C-c> :COQnow --shut-up<CR>

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
