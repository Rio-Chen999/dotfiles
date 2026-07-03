" close splash
set shortmess+=I
" =================================================
let mapleader=" "
let maplocalleader=" "
" Ensure consistency with the Linux environment
set encoding=utf-8
set fileformat=unix

" Close bell
set noerrorbells
set visualbell
set t_vb=

" Enable colorful terminal support
if &t_Co > 2 || has("gui_running")
    set termguicolors
endif

" Set cursor to block without blink in normal, visual and commandline mode
if &term =~ "xterm"
    " INSERT mode
    let &t_SI = "\<Esc>[6 q" . "\<Esc>]12;white\x7"
    " REPLACE mode
    let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;black\x7"
    " NORMAL mode
    let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;green\x7"
endif

" Enable syntax highlighting and smart indenting
syntax on

" Share system clipboard
" sudo apt install vim-gtk3 vim-runtime
set clipboard=unnamedplus

set showmatch
set nocp
filetype plugin indent on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
autocmd FileType html setlocal ts=2 sw=2 et

set number
set relativenumber
set nocursorline
set mat=2
set showmatch
set hlsearch
set ignorecase
set smartcase
colorscheme murphy
if exists('g:GuiLoaded')
    " GUI Vim
    set guifont=FiraCode\ Nerd\ Font:h12
else
    " termimal Vim
    set guifontwide=FiraCode\ Nerd\ Font:h12
endif

nnoremap <C-j> 10j
nnoremap <C-k> 10k
vnoremap <C-j> 10j
vnoremap <C-k> 10k
set autochdir
" ==================================================

" ==================================================
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'     " gcc: toggle comments / uncomments
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'jlanzarotta/bufexplorer'  " buffer explorer: <leader>bt normal open | <leader>be toggle open/close | <leader>bs force horizontal split open | <leader>bv force vertical split open
Plug 'junegunn/vim-peekaboo'
Plug 'voldikss/vim-floaterm'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jreybert/vimagit'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" ==================================================
nnoremap <C-a> gg^vG$
nnoremap ,, :Vex<CR>
nnoremap gU vawgU
nnoremap gu vawgu
let g:netrw_browse_split = 4
let g:netrw_liststyle = 1
let g:netrw_winsize = 25
" let g:netrw_altv = 1

" Complete by Tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>

nnoremap <leader>bb :enew<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <S-Tab> :bn<CR>
nnoremap <leader>co :only<CR>

nnoremap <C-f> :Files<CR>
nnoremap <C-B> :Buffers<CR>
nnoremap <leader>gf :GFiles<CR>

nnoremap <silent> gd <Plug><coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

nnoremap <leader>mg :MagitOnly<CR>

if empty(glob('~/.vim'))
    silent !mkdir ~/.vim
endif
if empty(glob('~/.vim/files'))
    silent !mkdir ~/.vim/files
endif
if empty(glob('~/.vim/files/backup'))
    silent !mkdir ~/.vim/files/backup
endif
if empty(glob('~/.vim/files/swap'))
    silent !mkdir ~/.vim/files/swap
endif
if empty(glob('~/.vim/files/undo'))
    silent !mkdir ~/.vim/files/undo
endif
if empty(glob('~/.vim/UltiSnips'))
    silent !mkdir ~/.vim/UltiSnips
endif

set backupdir=~/.vim/files/backup//
set directory=~/.vim/files/swap//
set undodir=~/.vim/files/undo//
set undofile

nnoremap <C-t> :FloatermToggle<CR>
tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>
tnoremap <C-j> <C-\><C-n>:FloatermNext<CR>
tnoremap <C-k> <C-\><C-n>:FloatermKill<CR>
tnoremap <C-n> <C-\><C-n>:FloatermNew<CR>
tnoremap <ESC> <C-\><C-n>

nnoremap <leader>gv :e ~/.vimrc<CR>
nnoremap <F1> :source ~/.vimrc<CR>

nnoremap <leader>qq :qa!<CR>
