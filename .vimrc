set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'LeafCage/yankround.vim'

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set backspace=indent,eol,start
syntax on

if has("autocmd")
  augroup redhat
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

au BufNewFile,BufRead *.rb      set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.erb     set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.yml     set nowrap tabstop=2 shiftwidth=2 softtabstop=2

nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
