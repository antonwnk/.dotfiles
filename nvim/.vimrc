syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Some configuration for yaml indenting
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0#

" Set python language support for this obscure Tiltfile from Tilt
autocmd BufNewFile,BufRead Tiltfile set syntax=python

" Enable mouse
set mouse=a
" Display line numbers
set number
set relativenumber
set hidden
set scrolloff=12
set nowrap

set splitbelow
set splitright

" Remap leader
nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" svermeulen/vim-cutlass retain x behaviour
nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D

nnoremap Y y$

" center search results
nnoremap n nzz
nnoremap N Nzz

" Diff between unsaved saved and buffer version (i.e. write to diff)
nnoremap <F6> :w !diff  % -<CR>
" Change CWD to file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

set is hlsearch ai ic scs

set clipboard=unnamed

set undodir=~/.vim/undodir
set undofile

set foldmethod=manual 
" set foldnestmax=10
" set nofoldenable
" set foldlevel=2

inoremap kj <Esc>
inoremap Kj <Esc>
inoremap kJ <Esc>
inoremap KJ <Esc>

