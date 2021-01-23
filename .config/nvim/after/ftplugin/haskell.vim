
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

let &l:makeprg = 'stack build --copy-bins'

setlocal formatoptions-=ro
