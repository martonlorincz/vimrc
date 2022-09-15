# vimrc
*Vim config files*

## Branches:
 - main: Windows version with plugins, using *vim-plug*
 - win-noplug: Windows version without plugins
 - linux: Linux version with plugins
 - linux-noplug: Linux version without plugins
 - minimal: Doesn't contain plugins or platform specifc options

## Plugin Deployment Notes:
### Plugin Install:
gruvbox:        `git clone https://github.com/morhetz/gruvbox.git ~/vimfiles/pack/default/start/gruvbox`
vim-airline:    `git clone https://github.com/vim-airline/vim-airline ~/vimfiles/pack/default/start/vim-airline`
nerdtree:       `git clone https://github.com/preservim/nerdtree.git ~/vimfiles/pack/default/start/nerdtree`
autocomplpop:   `git clone https://github.com/vim-scripts/AutoComplPop ~/vimfiles/pack/default/start/autocomplpop`
taglist:        `git clone https://github.com/yegappan/taglist ~/vimfiles/pack/default/start/taglist`

### Helptags:
`helptags ~/vimfiles/pack/default/start/vim-airline/doc`
`helptags ~/vimfiles/pack/default/start/nerdtree/doc`
`helptags ~/vimfiles/pack/default/start/autocomplpop/doc`
`helptags ~/vimfiles/pack/default/start/taglist/doc`

## TODO:
 - Create scripts for deployment of plugins and other files
 - Add modified *qf.vim* to repo

