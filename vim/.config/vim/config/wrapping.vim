" Line wrapping and max width
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=90

augroup textwidth
    autocmd!
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd BufRead *.phtml,*.html setlocal textwidth=0
augroup END
