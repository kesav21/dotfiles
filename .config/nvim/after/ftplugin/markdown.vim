
hi! link markdownH1 GruvboxYellowBold
hi! link markdownH2 GruvboxYellowBold
hi! link markdownH3 GruvboxYellowBold
hi! link markdownH4 GruvboxYellowBold
hi! link markdownH5 GruvboxYellowBold
hi! link markdownH6 GruvboxYellowBold

hi! link markdownHeadingDelimiter GruvboxGray

" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'

" actually highlight the region we defined as "math"
hi link math Statement

let &makeprg='pandoc -s -t html5 --pdf-engine=wkhtmltopdf --katex -o %:r.pdf %'

