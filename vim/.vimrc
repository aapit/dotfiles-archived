set shell=/bin/sh
set nocompatible

set number
set clipboard=unnamed

set incsearch
set hlsearch

source ~/.config/vim/config/folding.vim
source ~/.config/vim/config/sessions.vim
source ~/.config/vim/config/temp-swap.vim
source ~/.config/vim/config/keys.vim
source ~/.config/vim/config/appearance.vim
source ~/.config/vim/config/statusbar.vim
source ~/.config/vim/config/plugins.vim
source ~/.config/vim/config/history.vim
source ~/.config/vim/config/tabs-spaces.vim
source ~/.config/vim/config/wrapping.vim
source ~/.config/vim/config/ctrlp.vim
source ~/.config/vim/config/nerdtree.vim
source ~/.config/vim/config/templates.vim
source ~/.config/vim/config/garp.vim
source ~/.config/vim/config/macvim.vim

" Don't require saving during buffer switching
set hidden


" [VIMRC] ______________________________________
" quick access to $MYVIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>pp :%!python -m json.tool<cr>

nnoremap <C-Tab> :bNext<cr>
nnoremap <Tab> :b#<cr>



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


