" [KEY MAPPING] _______________________________
let mapleader = " "

" Semicolon leader instead of colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Edit whole string with c'
" onoremap ' i'
" onoremap " i"


" Frontmatter / date macros
" Todo: in paste mode, this should first :set nopaste
nnoremap <A-D> :exec 'normal i'.system("~/Scripts/bash_env/datestamp.sh \| tr '\r' ' '")<cr>i
inoremap <A-D> <C-R>=strftime("%Y%m%d")<cr>
nnoremap <A-F> :exec 'normal i'.system("~/Scripts/bash_env/frontmatter.sh \| tr '\r' ' '")<cr>i
inoremap <A-F> <esc>$ :exec 'normal i'.system("~/Scripts/bash_env/frontmatter.sh \| tr '\r' ' '")<cr>i

" Horizontal ruler: underscores for H1 markdown headers
nnoremap <leader>_ o<esc>80i_<esc>o<esc>
" Horizontal ruler: dashes for H2+ markdown headers
nnoremap <leader>- o<esc>80i-<esc>o<esc>

" Close buffer shortcut
nnoremap <leader>x :bw<cr>

" Open current file in external editor (GhostWriter)
nnoremap <A-o> :!/snap/bin/ghostwriter-casept.ghostwriter "%" 2>/dev/null &<cr><cr>

" Copy-paste with system clipboard (Alt-y and Alt-p)
vnoremap <A-y> "+y
xnoremap <A-y> "+y
nnoremap <A-p> "+p
inoremap <A-p> <esc>"+pA
