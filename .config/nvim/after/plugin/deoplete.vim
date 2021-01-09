
let g:deoplete#enable_at_startup = 1

inoremap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr> <cr>    pumvisible() ? "\<c-y>" : "\<cr>"

call deoplete#custom#option('smart_case', v:true)

