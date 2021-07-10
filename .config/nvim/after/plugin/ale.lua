vim.g.ale_linters = {
	c = { "clangd" },
	lua = { "luacheck" },
	terraform = {},
	rust = { "cargo" },
}

vim.g.ale_rust_cargo_use_clippy = 1

vim.g.ale_lua_luacheck_options = "--globals vim"
