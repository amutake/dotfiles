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
  \   },
  \ }

NeoBundle 'Shougo/neocomplete' " requires vim compiled with if-lua option
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'scrooloose/syntastic'

" appearance
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'w0ng/vim-hybrid'

" Haskell
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'ujihisa/ref-hoogle'
NeoBundle 'ujihisa/unite-haskellimport'
NeoBundle 'travitch/hasksyn'

" Idris
NeoBundle 'idris-hackers/idris-vim'

" Go
NeoBundle 'Blackrush/vim-gocode'

filetype plugin indent on

NeoBundleCheck

" misc
set number
syntax on

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

set backspace=indent,eol,start
set backup writebackup backupcopy=yes backupext=.bak backupdir=~/.vim/backup
if !isdirectory(&backupdir)
  call mkdir(&backupdir, 'p')
endif
set swapfile
set directory=.

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 2
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif

" lightline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
  \ 'colorscheme' : 'wombat',
  \ }

" colorscheme
colorscheme hybrid
highlight Normal ctermbg=none

" key-remap (emacs-like)
nnoremap <tab> ==
inoremap <tab> <C-f>

noremap <C-a> ^
inoremap <C-a> <Home>
noremap <C-e> $
inoremap <C-e> <End>

nnoremap Y y$

" autocmds

" https://docwhat.org/vim-preserve-your-cursor-and-window-state/
function! Preserve(command)
  let last_search=@/
  let save_cursor = getpos('.')
  normal H
  let save_window = getpos('.')
  call setpos('.', save_cursor)

  execute a:command

  let @/=last_search
  call setpos('.', save_window)
  normal zt
  call setpos('.', save_cursor)
endfunction

" delete trailing whitespace and blank line
" http://stackoverflow.com/a/356130
" http://stackoverflow.com/a/7496112
autocmd BufWritePre * :call Preserve('%s/\(\s\+$\)\|\(\(\n\|\s\)\+\%$\)//e')
