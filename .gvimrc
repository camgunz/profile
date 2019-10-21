set guioptions=a
if has("win32") || has("win16")
    set guifont=Input:h8:cANSI
elseif has("gui_macvim")
    "set guifont=Liberation\ Mono:h11
    "set guifont=Px437\ IBM\ ISO9:h16
    "set guifont=Liberation\ Mono:h13
    "set guifont=Generic\ Mono\ II:h11
    "set guifont=Cousine:h11
    set guifont=Source\ Code\ Pro:h12
else
    "set guifont=Liberation\ Mono\ 9
    "set guifont=Px437\ IBM\ ISO9\ 9
    set guifont=Source\ Code\ Pro\ 9
endif

set background=dark

"colorscheme solarized
"colorscheme macvim
"colorscheme midori
"colorscheme asmdev
colorscheme amber
