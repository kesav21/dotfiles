vim.cmd [[command! Bd b#|bd#]]
vim.cmd [[cnoreabbrev bd Bd]]

-- use :LspRestart instead
-- vim.cmd [[ command! RestartLsp lua vim.lsp.stop_client(vim.lsp.get_active_clients()) ]]
