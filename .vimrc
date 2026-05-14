" =================================================
let mapleader=" "
let maplocalleader=" "
" Ensure consistency with the Linux environment
set encoding=utf-8
set fileformat=unix

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
filetype plugin indent on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
autocmd FileType javascript setlocal ts=2 sw=2 et
autocmd FileType html setlocal ts=2 sw=2 et

set number
set relativenumber
set cursorline
set mat=2
set showmatch
set background=dark
colorscheme industry
if has('gui_running')
    set guifont=Fira_Code:h12
endif

nnoremap <C-j> 10j
nnoremap <C-k> 10k
set autochdir
" ==================================================

" ==================================================
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'     " gcc: toggle comments / uncomments
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'LunarWatcher/auto-pairs'
Plug 'jlanzarotta/bufexplorer'  " buffer explorer: <leader>bt normal open | <leader>be toggle open/close | <leader>bs force horizontal split open | <leader>bv force vertical split open
Plug 'junegunn/vim-peekaboo'
call plug#end()

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#wordcount#enabled = 1

" ==================================================
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>a gg^vG$

" Complete by Tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

nnoremap <leader>1 :1tabn<CR>
nnoremap <leader>2 :2tabn<CR>
nnoremap <leader>3 :3tabn<CR>
nnoremap <leader>4 :4tabn<CR>
nnoremap <leader>5 :5tabn<CR>
nnoremap <leader>6 :6tabn<CR>
nnoremap <leader>7 :7tabn<CR>
nnoremap <leader>8 :8tabn<CR>
nnoremap <leader>9 :9tabn<CR>
nnoremap <leader>10 :10tabn<CR>
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>

nnoremap gbb :enew<CR>
nnoremap gbd :bd<CR>

nnoremap <C-f> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>gf :GFiles<CR>

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

set backupdir=~/.vim/files/backup//
set directory=~/.vim/files/swap//
set undodir=~/.vim/files/undo//
set undofile

nnoremap tm :tabnew<CR>:terminal<CR><C-\><C-n>:only<CR>i
tnoremap <ESC> <C-\><C-n>
tnoremap <ESC><ESC> <C-\><C-n>:q!<CR>

nnoremap <leader>gv :e ~/.vimrc<CR>
nnoremap <F1> :source ~/.vimrc<CR>

nnoremap <leader>qq :qa!<CR>
