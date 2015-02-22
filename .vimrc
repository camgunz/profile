set nocompatible
set t_Co=256
filetype off
filetype plugin indent off
if has("win32") || has("win16")
    set rtp+=~/vimfiles/bundle/Vundle.vim
    let path='~/vimfiles/bundle'
    set backupdir=~/vimfiles/backup
    set undodir=~/vimfiles/undo
    call vundle#begin(path)
else
    set rtp+=~/.vim/bundle/Vundle.vim
    set backupdir=~/.vim/backup
    set undodir=~/.vim/undo
    call vundle#begin()
endif

Plugin 'gmarik/Vundle.vim'
Plugin 'camgunz/midori'
Plugin 'camgunz/cf-utils.vim'

call vundle#end()

set mouse=a
set shiftwidth=4
set tabstop=4
set expandtab
set autochdir
set autoindent
set ruler
set hlsearch
set modeline
scriptencoding utf-8
set encoding=utf-8
set tenc=utf-8
syntax on

set runtimepath+=$GOROOT/misc/vim

if has("win32") || has("win16")
    colors desert
else
    colors midori
endif

filetype on
filetype plugin indent on
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType c setlocal cindent
set cino=(s,m1,c1

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.mkd set filetype=markdown
"au BufRead,BufNewFile *.cfc set filetype=cfscript
"au BufRead,BufNewFile *.cfm set filetype=cfml

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


