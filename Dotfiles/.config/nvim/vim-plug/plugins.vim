" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/jun...
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

Plug 'dense-analysis/ale'
Plug 'rrethy/vim-hexokinase'

call plug#end()

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

call plug#end()
