set nocompatible
set t_Co=256
set shellcmdflag=-ic
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
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'camgunz/midori'
Plugin 'camgunz/amber'
Plugin 'camgunz/cf-utils.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-scripts/ebnf.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'udalov/kotlin-vim'
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plugin 'vim-scripts/gtk-vim-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'jparise/vim-graphql'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'alfredodeza/coveragepy.vim'
Plugin 'ambv/black'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

set mouse=a
set shiftwidth=4
set tabstop=4
set expandtab
set autochdir
set autoindent
set ruler
set hlsearch
set incsearch
set modeline
scriptencoding utf-8
set encoding=utf-8
set tenc=utf-8
set statusline=%F\ %m%=%r\ %h\ %w\ %l/%L:%c\ %P\ \ 
syntax on

"set runtimepath+=$GOROOT/misc/vim

set background=dark

if has("win32") || has("win16")
    colorscheme desert
else
    colorscheme amber
endif

let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

filetype on
filetype plugin indent on
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType c setlocal cindent
"set cino=(s,m1,c1

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'js=javascript', 'python', 'sylva']

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.mkd set filetype=markdown
au BufRead,BufNewFile *.kt set filetype=kotlin
au BufRead,BufNewFile *.kts set filetype=kotlin
au BufRead,BufNewFile *.sy set filetype=sylva
"au BufRead,BufNewFile *.cfc set filetype=cfscript
"au BufRead,BufNewFile *.cfm set filetype=cfml

let g:markdown_fenced_languages = ['html', 'python', 'c', 'js=javascript', 'sylva']

let g:black_linelength = 120
let g:black_skip_string_normalization = 1

let b:ale_linters = ['pylint', 'clang-check', 'flake8']

let g:ale_linters = {
\    'python': ['pylint', 'flake8']
\    'c': ['clang-check']
\}

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set exrc
set secure
set cc=120
