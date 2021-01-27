vim.bo.tabstop     = 2
vim.bo.shiftwidth  = 2
vim.bo.softtabstop = 2
vim.bo.expandtab   = true

vim.cmd [[ augroup format ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufWritePre undojoin | Neoformat ]]
vim.cmd [[ augroup END ]]