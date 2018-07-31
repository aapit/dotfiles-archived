set shell=/bin/sh
set nocompatible

set number
set clipboard=unnamed

set incsearch
set hlsearch

" Folding settings
set foldmethod=indent
set foldnestmax=2
set foldlevel=2
set nofoldenable

" Don't require saving during buffer switching
set hidden


" [SESSIONS] __________________________________
" Auto-save and -restore Sessions
"let g:session_autosave = 'yes'
let g:session_autoload = 'no'


" [TEMP & SWAP] _______________________________
" store swp files all in the same place
set noswapfile
"set directory=~/.vimtmp/swapdir
"if filewritable(&directory) == 0 | call mkdir(&directory, "p") | endif  

set undodir=~/.vimtmp/undodir


" [KEY MAPPING] _______________________________
let mapleader = ","

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


" [APPEARANCE] ________________________________
set guifont=Roboto\ Mono\ Light\ for\ Powerline:h15
" true colors
set t_Co=256

ca dark set background=dark
ca light set background=light

"colorscheme solarized


" [STATUSBAR] _________________________________
" Powerline
silent! python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Status bar generic
set laststatus=2
set cmdheight=1
set showmode
set showcmd
"set statusline=%f\ %y\ %m\ %r\ Line:\ %l/%L\ Col:\ %c\ Buf:\ #%n


" [PLUGIN MANAGER] ___________________________
execute pathogen#infect()
syntax on
filetype plugin indent on


" [HISTORY] ____________________________________
" persistent history
set history=1000
if exists("&undodir")
    set undodir=~/.vim/undodir
    if filewritable(&undodir) == 0 | call mkdir(&undodir, "p") | endif
    set undofile
endif

" return to last edit position when opening files 
autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal! g`\"" |
 \ endif


" [TABS vs SPACES] _____________________________
" tabs
set noet ci pi sts=0 sw=4 ts=4

" case-insensitive tab completion
set ignorecase
set infercase

" 4 space tabs, size of indent
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
set backspace=2

" a combination of spaces and tabs are used to simulate tab stops at
" a width other than the (hard)tabstop
set softtabstop=4
set scrolloff=3


" [WRAPPING] ___________________________________
" Line wrapping and max width
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=100
set formatoptions-=t
set colorcolumn=+1
augroup textwidth
    autocmd!
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd BufRead *.phtml,*.html setlocal textwidth=0
augroup END


" [NERDTREE] ____________________________________
let NERDTreeShowHidden=1 


" [CTRL-P] ______________________________________
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_custom_ignore = 'node_modules\|bower_components'
"let g:ctrlp_max_files = 40000
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore-dir bower_components --ignore-dir node_modules --ignore-dir .git'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore-dir bower_components --ignore-dir node_modules'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_use_caching = 1


" [MACVIM] _____________________________________
if has("gui_macvim")
	set fu
	set guioptions=ac  "remove right-hand scroll bar
	"set guioptions-=r  "remove right-hand scroll bar
	"set guioptions-=L  "remove left scrollbar when Nerdtree is opened
	"colorscheme solarized
	colorscheme kalisi
	set background=dark
endif


" [VIMRC] ______________________________________
" quick access to $MYVIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>pp :%!python -m json.tool<cr>

nnoremap <C-Tab> :bNext<cr>
nnoremap <Tab> :b#<cr>


" [TEMPLATES] __________________________________
function! ModelConfigTemplate(path)
    execute "0read ".expand("$HOME/.vim/templates/model_config.json")
endfunction

augroup templates
    au!
    " read in templates files
    autocmd BufNewFile **/library/*.php :call PhpLibraryTemplate(expand('<afile>'))
    autocmd BufNewFile **/models/config/*.json :call ModelConfigTemplate(expand('<afile>'))
augroup END


" [RUBY] _______________________________________
" Set .cap Capistrano files to Ruby syntax
au BufRead,BufNewFile *.cap set filetype=ruby

" [MARKDOWN] ___________________________________
" Set .md to Markdown syntax
au BufRead,BufNewFile *.md set filetype=markdown


" [PHP] ________________________________________
augroup phpfold
    au!
    au FileType php set foldenable
augroup END

" Method to create templates when creating a library file. 
function! PhpLibraryTemplate(path)
    let pos_from_lib=strridx(a:path, 'library') + strlen('library/')
    let pos_of_dot=strridx(a:path, '.')-1
    let path_from_lib=a:path[pos_from_lib : pos_of_dot]
    let classname=join(split(path_from_lib, '/'), '_')
    execute "normal! i<?php"
    execute "normal! Goclass ".classname." {"
    execute "normal! Go    "
    execute "normal! Go}"
    execute "normal! Gk"
endfunction


" [GARP] _______________________________________
augroup garpini
    autocmd!
    autocmd BufWritePost *.ini !php vendor/grrr-amsterdam/garp3/scripts/garp.php Cache clear 
augroup END
