if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/neocomplete' " requires vim compiled with if-lua option
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'

" Haskell
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/neco-ghc'

filetype plugin indent on

NeoBundleCheck

" misc
set number
syntax on
set expandtab
set tabstop=2
set backspace=indent,eol,start
set backup writebackup backupcopy=yes backupext=.bak backupdir=~/.vim/backup
if !isdirectory(&backupdir)
  call mkdir(&backupdir, 'p')
endif
set swapfile
set directory=.
