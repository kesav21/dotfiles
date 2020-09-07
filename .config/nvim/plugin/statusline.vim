
" only get branch once to improve performance
let g:branch = statusline#getbranch()
" create the necessary highlight groups
call statusline#createcolors()

set noshowmode
set laststatus=2

set statusline=
set statusline+=%{statusline#updatemodecolor(statusline#getmode())}
set statusline+=%#StatusMode#
set statusline+=\ %{statusline#getmode()}
set statusline+=\ %#StatusDark#
set statusline+=\ %{g:branch}
set statusline+=\ %#StatusDarker#
set statusline+=\ %F     " file path
set statusline+=\ %=
set statusline+=\ %m     " unsaved changes
set statusline+=\ %r     " readonly
set statusline+=\ %#StatusDark#
set statusline+=\ %y     " file type
set statusline+=\ %#StatusLight#
set statusline+=\ %cc    " column
set statusline+=\ %l/%LL " line
set statusline+=\        " padding

