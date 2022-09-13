" =============================================================================
" GUI specific configuration
" =============================================================================

"========= Windows specific settings =================================================================================="

" Make gVim full screen
au GUIEnter * simalt ~x

set guifont=JetBrains_Mono:h10:cANSI:qDRAFT

nnoremap <C-Up> :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)+1)',
 \ '')<CR>
nnoremap <C-Down> :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)-1)',
 \ '')<CR>

"======================================================================================================================"
set guioptions=

