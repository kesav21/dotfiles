
" python files have tabs set to 4
setlocal autoindent noexpandtab tabstop=4 shiftwidth=4


" emphasize text
nnoremap <leader>me A_<esc>I_<esc>
" bold text
nnoremap <leader>mb A__<esc>I__<esc>
" make line a list item
nnoremap <leader>ml I- <esc>j
" make line a quote
nnoremap <leader>mq I> <esc>j
" add period to end of line
nnoremap <leader>mp A.<esc>j

" removes emphasis
nnoremap <leader>mde 0x$x
" removes bold
nnoremap <leader>mdb 02x$xx
" delete list symbol
nnoremap <leader>mdl 02xj
" delete quote symbol
nnoremap <leader>mdq 02xj
" delete period
nnoremap <leader>mdp $xj

" make line a heading
nnoremap <leader>mh 0i# <esc>

