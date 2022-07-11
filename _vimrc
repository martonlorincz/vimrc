" Vim with all enhancements
source $VIMRUNTIME/defaults.vim

" =============================================================================
" Windows specific configs
" =============================================================================

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" Vim file paths on Windows
set directory=~/Vim/swapfiles//
set backupdir=~/Vim/backups//
set undofile
set undodir=~/Vim/undofiles//

set viminfo=%,'100,<50,s10,h,rA:,rB:,n~/Vim/.viminfo
set shell=~/Git/bin/bash.exe

nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"======================================================================================================================"

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

