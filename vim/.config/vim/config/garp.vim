" [GARP] _______________________________________
augroup garpini
    autocmd!
    autocmd BufWritePost *.ini !php vendor/grrr-amsterdam/garp3/scripts/garp.php Cache clear 
augroup END
