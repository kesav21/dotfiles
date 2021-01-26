
hi! link markdownH1 GruvboxYellowBold
hi! link markdownH2 GruvboxYellowBold
hi! link markdownH3 GruvboxYellowBold
hi! link markdownH4 GruvboxYellowBold
hi! link markdownH5 GruvboxYellowBold
hi! link markdownH6 GruvboxYellowBold

hi! link markdownHeadingDelimiter GruvboxGray

hi! link markdownCode GruvboxGray
hi! link markdownCodeBlock GruvboxGray
hi! link markdownCodeDelimiter GruvboxGray

" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'

" actually highlight the region we defined as "math"
hi link math Statement

let &l:makeprg='pandoc -s -t html5 --pdf-engine=wkhtmltopdf --katex --number-sections -o %:r.pdf %'

augroup project_config_markdown
	autocmd!
	autocmd VimEnter ~/asu/cse464/activity1.md let &l:makeprg='pandoc -s -t html5 --pdf-engine=wkhtmltopdf --katex -o %:r.pdf %'
augroup END
