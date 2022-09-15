" Vim with all enhancements
source $VIMRUNTIME/defaults.vim

"========= Windows specific settings =================================================================================="

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

" Vim file paths
set directory=~/vimfiles/swapfiles//
set backupdir=~/vimfiles/backups//
set undofile
set undodir=~/vimfiles/undofiles//

set viminfo=%,'100,<50,s10,h,rA:,rB:,n~/vimfiles/.viminfo

"======================================================================================================================"

set background=dark

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

"=====================================Plugin Configuration============================================================="

" Load Gruvbox dark
autocmd vimenter * ++nested colorscheme gruvbox

let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 1

nnoremap gn :NERDTreeToggle<cr>

"======================================================================================================================"

" Random stuff from Learn Vimscript the Hard way
:let mapleader = ","
noremap <leader>_ ddkP
noremap <leader>- ddp
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" TODO: when sourcing, keep the same highlighting
nnoremap <leader>sv :source $MYVIMRC<cr>
" :noh<cr>

" TODO: Make these tcl specific
iabbrev war #WARNING#
iabbrev cur #CURR#
iabbrev tdo #TODO#
nnoremap <leader>w :w<CR>

" List grep results in locationlist
command -nargs=1 Lg lvimgrep /<args>/ % | lopen
" TODO: The tcl buftype mapping messes up <cr> key in qf list, fix it!
nnoremap <expr> o &buftype ==# 'quickfix' ? "\<CR><c-w>j" : 'o'
nnoremap gl :lopen<CR>

augroup tclGroup
    autocmd!
    " Navigate by proc and namespace
    autocmd FileType tcl nnoremap <c-n> :call search('^\s*proc', "w")<cr>
    autocmd FileType tcl nnoremap <c-m> :call search('^\s*proc', "wb")<cr>

    autocmd FileType tcl nnoremap <c-.> :call search('^\s*namespace eval', "w")<cr>
    autocmd FileType tcl nnoremap <c-,> :call search('^\s*namespace eval', "wb")<cr>
augroup end

" Window management mappings
" TODO: change position of the splits
nnoremap gj <c-w><c-j> 
nnoremap gk <c-w><c-k> 
nnoremap gh <c-w>h
nnoremap gl <c-w>l
nnoremap gm :resize<cr>
nnoremap gv :vertical resize<cr>
nnoremap g= <c-w>=

nnoremap <leader>3 *``
nnoremap <leader>n :noh<cr>
inoremap jk <esc>
" REMOVES <esc> functionality
inoremap <esc> <nop>
nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>j

" Window resizing
nnoremap <C-J> <C-W>-
nnoremap <C-K> <C-W>+
nnoremap <C-H> <C-W><
nnoremap <C-L> <C-W>>


" Operator pending mappings
" In/around next curly braces
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap an{ :<c-u>normal! f{va{<cr>
" In/around previous(last) curly braces
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>

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
