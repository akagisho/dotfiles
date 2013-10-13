set nocompatible
filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()

set expandtab
set tabstop=4
set number
syntax on

au BufNewFile,BufRead *.rb      set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.erb     set nowrap tabstop=2 shiftwidth=2
