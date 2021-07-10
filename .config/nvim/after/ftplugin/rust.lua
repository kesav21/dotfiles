vim.wo.colorcolumn = '100'

vim.bo.tabstop     = 4
vim.bo.shiftwidth  = 4
vim.bo.softtabstop = 4
vim.bo.expandtab   = true

vim.cmd [[ augroup format ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry ]]
vim.cmd [[ augroup END ]]
