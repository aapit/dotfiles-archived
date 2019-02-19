let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1

fun! EnableFocusMode()
    silent execute 'Goyo 80'
endfun
fun! DisableFocusMode()
    silent execute 'Goyo!'
endfun

augroup focusmode
    autocmd!
    autocmd BufEnter *.md call EnableFocusMode()
    autocmd BufLeave *.md call DisableFocusMode()
augroup end
