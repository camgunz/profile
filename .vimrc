set nocompatible
set t_Co=256
set shellcmdflag=-c
filetype off
filetype plugin indent off
if has("win32") || has("win16")
    "set rtp+=~/vimfiles/bundle/Vundle.vim
    "let path='~/vimfiles/bundle'
    let path='~/vimfiles/plugged'
    set backupdir=~/vimfiles/backup
    set undodir=~/vimfiles/undo
    "call vundle#begin(path)
    call plug#begin(plugged)
else
    "set rtp+=~/.vim/bundle/Vundle.vim
    set backupdir=~/.vim/backup
    set undodir=~/.vim/undo
    "call vundle#begin()
    call plug#begin('~/.vim/plugged')
endif

"Plugin 'gmarik/Vundle.vim'

Plug 'plasticboy/vim-markdown'
Plug 'camgunz/midori'
Plug 'camgunz/amber'
Plug 'camgunz/asmdev'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'godlygeek/tabular'
Plug 'dart-lang/dart-vim-plugin'
Plug 'udalov/kotlin-vim'
Plug 'vim-scripts/gtk-vim-syntax'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
"Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'jmcantrell/vim-virtualenv'
Plug 'thinca/vim-localrc'
Plug 'tpope/vim-fugitive'
Plug 'leafoftree/vim-svelte-plugin'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'junegunn/seoul256.vim'
Plug 'hashivim/vim-terraform'
Plug 'moll/vim-bbye'
Plug 'wlangstroth/vim-racket'
Plug 'rust-lang/rust'

"call vundle#end()
call plug#end()

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
au BufReadPost *.rkt,*.rktl set filetype=scheme

"let g:ale_c_parse_compile_commands=1
"let g:ale_c_build_dir='cbuild'
"let g:ale_lint_on_text_changed=0
"let g:ale_lint_on_insert_leave=0
"let g:ale_lint_on_enter=1
"let g:ale_lint_on_save=1
"let g:ale_lint_on_filetype_changed=1
"let g:ale_fix_on_save=1

""let b:ale_linters = ['pylint', 'cppcheck', 'flake8']
""let g:ale_linters = {
""\    'python': ['pylint', 'flake8'],
""\    'c': ['cppcheck'],
""\    'ch': ['cppcheck']
""\}
""let g:ale_fixers = {
""\   'go': ['goimports', 'trim_whitespace', 'remove_trailing_lines'],
""\}
""let g:ale_linters = {
""\   'go': ['govet'],
""\}

let g:lsp_settings = {
\   'terraform-ls': {
\     'rootModulePaths': ['/Users/charlie/code/aws_edw/dataverse/infra/dev01'],
\   },
\}

let g:lsp_diagnostics_echo_cursor=1
let g:lsp_diagnostics_echo_delay=0
let g:lsp_insert_text_enabled=0
let g:lsp_text_edit_enabled=0
let g:lsp_diagnostics_signs_insert_mode_enabled=1
let g:lsp_document_highlight_enabled=0
let g:lsp_fold_enabled=0

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

if getcwd() =~# '^/home/charlie/code'
    set secure exrc
endif

if getcwd() =~# '^/Users/cgunyon/code'
    set secure exrc
endif


