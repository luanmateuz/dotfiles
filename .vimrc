let mapleader = ","
syntax on

filetype plugin indent on

set paste
set number
set relativenumber

set expandtab
set nowrap
set scrolloff=4
set shiftwidth=4
set tabstop=4

set autoindent
set smartindent

set hlsearch
set incsearch
set showmatch

set termguicolors
set colorcolumn=80
set signcolumn="yes"

" keymaps
nnoremap <leader>pv :Ex<CR>

" fast saving/quiting
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" edit/load vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>ss :source $MYVIMRC<CR>

" copy/paste
nnoremap <leader>y "+y

set clipboard=unnamedplus

" move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <A-J> :m .+1<CR>==
nnoremap <A-K> :m .-2<CR>==

" show tabs, spaces, eol...
set listchars=tab:>·,space:␣,eol:¬,trail:~,extends:>,precedes:<
nnoremap <leader>ht :set list!<CR>

autocmd FileType c setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType py setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType js setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType ts setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType go setlocal shiftwidth=8 tabstop=8 softtabstop=8 textwidth=80 noexpandtab
