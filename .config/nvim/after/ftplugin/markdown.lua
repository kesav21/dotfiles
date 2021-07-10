
vim.o.joinspaces = false
vim.wo.colorcolumn = ''
vim.bo.formatoptions = 'rj'

vim.cmd [[ hi! link markdownH1 GruvboxYellowBold ]]
vim.cmd [[ hi! link markdownH2 GruvboxYellowBold ]]
vim.cmd [[ hi! link markdownH3 GruvboxYellowBold ]]
vim.cmd [[ hi! link markdownH4 GruvboxYellowBold ]]
vim.cmd [[ hi! link markdownH5 GruvboxYellowBold ]]
vim.cmd [[ hi! link markdownH6 GruvboxYellowBold ]]

vim.cmd [[ hi! link markdownHeadingDelimiter GruvboxGray ]]

vim.cmd [[ hi! link markdownCode GruvboxGray ]]
vim.cmd [[ hi! link markdownCodeBlock GruvboxGray ]]
vim.cmd [[ hi! link markdownCodeDelimiter GruvboxGray ]]

-- This gets rid of the nasty _ italic bug in tpope's vim-markdown
-- block $$...$$
vim.cmd [[ syn region math start=/\$\$/ end=/\$\$/ ]]
-- inline math
vim.cmd [[ syn match math '\$[^$].\{-}\$' ]]

-- actually highlight the region we defined as "math"
vim.cmd [[ hi link math Statement ]]

vim.bo.makeprg = 'pandoc -s -t html5 --pdf-engine=wkhtmltopdf --katex --number-sections -o %:r.pdf %'

vim.cmd [[ augroup project_config_markdown ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd VimEnter ~/asu/cse464/activity1.md lua vim.bo.makeprg = 'pandoc -s -t html5 --pdf-engine=wkhtmltopdf --katex -o %:r.pdf %' ]]
vim.cmd [[ augroup END ]]

vim.cmd [[ augroup format ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry ]]
vim.cmd [[ augroup END ]]
