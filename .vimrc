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
Plugin 'plasticboy/vim-markdown'
Plugin 'camgunz/midori'
Plugin 'camgunz/amber'
Plugin 'camgunz/asmdev'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'godlygeek/tabular'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'udalov/kotlin-vim'
Plugin 'vim-scripts/gtk-vim-syntax'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'jparise/vim-graphql'
Plugin 'dense-analysis/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'thinca/vim-localrc'
Plugin 'tpope/vim-fugitive'
Plugin 'leafoftree/vim-svelte-plugin'

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
set bufhidden=delete
set statusline=%F\ %m%=%r\ %h\ %w\ %l/%L:%c\ %P\ \ 
syntax on

set background=dark

if has("win32") || has("win16")
    colorscheme desert
else
    colorscheme midori
    " colorscheme amber
endif

let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

filetype on
filetype plugin indent on
autocmd FileType c setlocal cindent
"set cino=(s,m1,c1

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_new_list_item_indent=0
let g:markdown_fenced_languages=['html', 'python', 'c', 'js=javascript', 'sylva']

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.mkd set filetype=markdown
au BufRead,BufNewFile *.c set filetype=c
au BufRead,BufNewFile *.h set filetype=c
au BufRead,BufNewFile *.kt set filetype=kotlin
au BufRead,BufNewFile *.kts set filetype=kotlin
au BufRead,BufNewFile *.sy set filetype=sylva

let g:ale_c_parse_compile_commands=1
let g:ale_c_build_dir='cbuild'
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_insert_leave=0
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1
let g:ale_lint_on_filetype_changed=1
let g:ale_fix_on_save=1

"let b:ale_linters = ['pylint', 'cppcheck', 'flake8']
"let g:ale_linters = {
"\    'python': ['pylint', 'flake8'],
"\    'c': ['cppcheck'],
"\    'ch': ['cppcheck']
"\}
"let g:ale_fixers = {
"\   'go': ['goimports', 'trim_whitespace', 'remove_trailing_lines'],
"\}
"let g:ale_linters = {
"\   'go': ['govet'],
"\}

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

if getcwd() =~# '^/home/charlie/code'
    set secure exrc
endif

if getcwd() =~# '^/Users/cgunyon/code'
    set secure exrc
endif
