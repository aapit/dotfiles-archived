" [APPEARANCE] ________________________________
"set guifont=Roboto\ Mono\ Light\ for\ Powerline:h15
set formatoptions-=t
set colorcolumn=+1
colorscheme spacemonkey_dark

" true colors
set t_Co=256

fun! Light()
    "let oldcmdheight = &cmdheight
    "let &cmdheight = 1
    silent !. ~/Scripts/interface/switch-to-light.sh
    colorscheme spacemonkey_light
    "let &cmdheight = oldcmdheight
endfun
fun! Dark()
    silent !. ~/Scripts/interface/switch-to-dark.sh
    colorscheme spacemonkey_dark
endfun

ca light call Light()
ca dark call Dark()

"________________________________________________________________________________

set guicursor+=n-v-c:blinkon1
