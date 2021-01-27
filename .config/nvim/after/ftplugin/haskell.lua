vim.bo.tabstop     = 2
vim.bo.shiftwidth  = 2
vim.bo.softtabstop = 2
vim.bo.expandtab   = true

vim.bo.makeprg = 'stack build --copy-bins'

vim.cmd [[ augroup format ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufWritePre * undojoin | Neoformat ]]
vim.cmd [[ augroup END ]]
