" [STATUSBAR] _________________________________
" Powerline
"silent! python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

" Status bar generic
set laststatus=2
set cmdheight=1
set showmode
set showcmd
"set statusline=%f\ %y\ %m\ %r\ Line:\ %l/%L\ Col:\ %c\ Buf:\ #%n