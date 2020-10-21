lua require('configure-lsp')

nnoremap <silent> gd         <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi         <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gt         <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr         <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K          <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
inoremap <silent> <c-k>      <cmd>lua vim.lsp.buf.signature_help()<CR>

" set omnifunc="v:lua.vim.lsp.omnifunc"
" sign define LspDiagnosticsErrorSign       text=✖
" sign define LspDiagnosticsWarningSign     text=⚠
" sign define LspDiagnosticsInformationSign text=ℹ
" sign define LspDiagnosticsHintSign        text=➤

" highlight LspDiagnosticsError       guifg=Red
" highlight LspDiagnosticsWarning     gui=bold guifg=DarkYellow
" highlight LspDiagnosticsInformation gui=bold guifg=DarkYellow
" highlight LspDiagnosticsHint        gui=bold guifg=DarkYellow

