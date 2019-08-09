set shell=/bin/sh
set nocompatible

set number
set clipboard=unnamed

set incsearch
set hlsearch

source ~/.config/vim/config/appearance.vim
source ~/.config/vim/config/folding.vim
source ~/.config/vim/config/sessions.vim
source ~/.config/vim/config/temp-swap.vim
source ~/.config/vim/config/keys.vim
source ~/.config/vim/config/statusbar.vim
source ~/.config/vim/config/plugins.vim
source ~/.config/vim/config/history.vim
source ~/.config/vim/config/tabs-spaces.vim
source ~/.config/vim/config/wrapping.vim
source ~/.config/vim/config/search.vim
"source ~/.config/vim/config/ctrlp.vim
source ~/.config/vim/config/nerdtree.vim
source ~/.config/vim/config/templates.vim
source ~/.config/vim/config/buffers.vim
source ~/.config/vim/config/macvim.vim
source ~/.config/vim/config/notational.vim
source ~/.config/vim/config/markdown.vim

" Language specific configuration
source ~/.config/vim/config/python.vim
source ~/.config/vim/config/php.vim
source ~/.config/vim/config/garp.vim
source ~/.config/vim/config/ruby.vim
source ~/.config/vim/config/markdown.vim


" [VIMRC] ______________________________________
" quick access to $MYVIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

