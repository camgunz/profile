set guioptions=a
tnoremap <S-space> <space>
if has("win32") || has("win16")
    set guifont=Input:h8:cANSI
elseif has("gui_macvim")
    " set guifont=Liberation\ Mono:h11
    " set guifont=Px437\ IBM\ ISO9:h16
    " set guifont=Generic\ Mono\ II:h11
    " set guifont=Cousine:h11
    " set guifont=Source\ Code\ Pro:h12
    " set guifont=GohuFont:h14
    set guifont=ProggySquareTTSZ:h16
    set noantialias
else
    " Noto Mono
    " Office Code Pro
    " Roboto Mono
    " set guifont=Px437\ IBM\ ISO9\ 14
    " set guifont=Cousine\ 9,Twitter\ Color\ Emoji\ 9
    set guifont=Source\ Code\ Pro\ 9,Twitter Color Emoji\ 9
endif

" colorscheme macvim
colorscheme midori
" colorscheme asmdev
" colorscheme amber


set background=dark
" set background=light
" set columns=382
" set lines=93

" set columns=382
" set lines=85
