set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'

set expandtab
set tabstop=4
set shiftwidth=4
set number
syntax on

au BufNewFile,BufRead *.rb      set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.erb     set nowrap tabstop=2 shiftwidth=2
