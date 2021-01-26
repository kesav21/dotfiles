vim.cmd [[ augroup format ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufWritePre undojoin | Neoformat ]]
vim.cmd [[ augroup END ]]
