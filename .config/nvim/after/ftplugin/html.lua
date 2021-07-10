vim.bo.tabstop     = 2
vim.bo.shiftwidth  = 2
vim.bo.softtabstop = 2
vim.bo.expandtab   = true

vim.cmd [[ augroup format ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry ]]
vim.cmd [[ augroup END ]]

vim.cmd [[ hi! link htmlScriptTag      GruvboxAqua ]]
vim.cmd [[ hi! link htmlSpecialTagName GruvboxAqua ]]
vim.cmd [[ hi! link htmlTag            GruvboxAqua ]]
vim.cmd [[ hi! link htmlTagError       GruvboxAqua ]]
vim.cmd [[ hi! link htmlTagN           GruvboxAqua ]]
vim.cmd [[ hi! link htmlEndTag         GruvboxAqua ]]
vim.cmd [[ hi! link htmlTagName        GruvboxAqua ]]

vim.cmd [[ hi! link htmlH1 GruvboxNone ]]
vim.cmd [[ hi! link htmlH2 GruvboxNone ]]
vim.cmd [[ hi! link htmlH3 GruvboxNone ]]
vim.cmd [[ hi! link htmlH4 GruvboxNone ]]
vim.cmd [[ hi! link htmlH5 GruvboxNone ]]
vim.cmd [[ hi! link htmlH6 GruvboxNone ]]
