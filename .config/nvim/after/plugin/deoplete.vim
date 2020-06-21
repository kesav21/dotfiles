
inoremap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<c-j>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<c-k>"
inoremap <expr> <cr>    pumvisible() ? "\<c-y>" : "\<cr>"

call deoplete#custom#option('smart_case', v:true)

