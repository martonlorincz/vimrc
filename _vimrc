" Vim with all enhancements
source $VIMRUNTIME/defaults.vim

set encoding=UTF-8
" set fileencoding=iso-8859-1

" Set listchars to indicate whitespace
" Can be turned on and of with :set list!
set listchars=tab:>-,space:.,extends:>,precedes:<
" To automatically show whitespace
set list!

" Set tabsize to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Unindent with SHFT Tab in insert mode
inoremap <S-Tab> <C-D>
nnoremap <S-Tab> <<

" Autocompletion setup
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set formatoptions-=ro

" Set linenumbers
set number
set relativenumber

" Set cursor column and line
" set cursorcolumn
set cursorline

set colorcolumn=120

" Miscallenious
set belloff=all
set textwidth=0
set nowrap
set ignorecase
set smartcase
" :checktime is an option here
set autoread
set hlsearch
set diffopt+=vertical
set scrolloff=2

" Random stuff from Learn Vimscript the Hard way
:let mapleader = ","
noremap <leader>_ ddkP
noremap <leader>- ddp
" TODO: when sourcing, keep the same highlighting
nnoremap <leader>sv :source $MYVIMRC<cr>
" :noh<cr>

iabbrev war #WARNING#
iabbrev cur #CURR#
iabbrev tdo TODO:
" TODO: have some issues when used with operators
nnoremap L $
nnoremap H ^
nnoremap <leader>w :w<CR>

" List grep results in locationlist
command -nargs=1 Lg lvimgrep /<args>/ % | lopen
nnoremap <expr> o &buftype ==# 'quickfix' ? "\<CR><c-w>j" : 'o'
nnoremap gl :lopen<CR>

" Window management mappings
" TODO: change position of the splits
nnoremap gj <c-w><c-j> 
nnoremap gk <c-w><c-k> 
nnoremap gh <c-w>h
nnoremap gl <c-w>l

nnoremap <leader>3 *``
nnoremap <leader>n :noh<cr>
inoremap jk <esc>
" REMOVES <esc> functionality
inoremap <esc> <nop>
nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>j

nnoremap <C-J> <C-W>-
nnoremap <C-K> <C-W>+

" Whats up with this?
" vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" vnoremap : y:<C-r>"<C-b>

let maplocalleader = "\\"
"augroup misc
"   autocmd!
"   autocmd FileType tcl nnoremap <buffer> <localleader>3 I#<esc>
"   autocmd FileType vim nnoremap <buffer> <localleader>3 I"<esc>
"   autocmd FileType text nnoremap <buffer> <localleader>3 I"<esc>
"   autocmd FileType text setlocal norelativenumber
"augroup END

