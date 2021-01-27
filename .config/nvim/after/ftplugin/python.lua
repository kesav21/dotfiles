vim.bo.expandtab = true

vim.cmd [[ augroup python_format ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufWritePre * * undojoin | Neoformat ]]
vim.cmd [[ augroup END ]]
