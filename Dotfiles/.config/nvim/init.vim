set cursorline
set mouse=
" set termguicolors

source $HOME/.config/nvim/vim-plug/plugins.vim

let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'
let g:Hexokinase_highlighters = [ 'backgroundfull' ]

highlight clear StatusLine

set ignorecase

au VimLeave,VimSuspend * set guicursor=a:ver90:block-blinkon0
