"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/amutake/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/amutake/.cache/dein')
  call dein#begin('/Users/amutake/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/amutake/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('itchyny/lightline.vim')
  call dein#add('w0ng/vim-hybrid')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

"End dein Scripts-------------------------


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
set background=dark
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
