vim.bo.tabstop     = 2
vim.bo.shiftwidth  = 2
vim.bo.softtabstop = 2
vim.bo.expandtab   = true

vim.bo.makeprg = 'stack build --copy-bins'

vim.cmd [[ augroup format ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry ]]
vim.cmd [[ augroup END ]]
