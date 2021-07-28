local has_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")
if not has_treesitter then
	print("lua/kesav/treesitter.lua: install nvim-treesitter/nvim-treesitter")
	return
end

treesitter.setup {
	ensure_installed = {
		"c",
		"cpp",
		"bash",
		"python",
		"typescript",
		"lua",
		"javascript",
		"query",
		"go",
		"java",
		-- "markdown",
		-- "html",
		"json",
		"tsx",
		"rust",
		"toml",
	},
	highlight = {
		enable = true,
		custom_captures = {
			-- constant?
			-- constant.builtin?

			-- markdown
			-- ["text.title"] = "GruvboxYellowBold",
			-- ["text.literal"] = "GruvboxAqua",
			-- ["text.strong"] = "GruvboxGray",
			-- ["text.emphasis"] = "GruvboxGray",
			-- ["text.uri"] = "GruvboxPurple",
			-- ["none"] = "GruvboxGray",

			-- html
			-- ["tag"] = "GruvboxAqua",
			-- ["tag.delimiter"] = "GruvboxAqua",
			-- ["error"] = "GruvboxRed",

			-- json
			-- ["constant.builtin"] = "GruvboxPurple",
			-- ["label"] = "GruvboxAqua",
			-- ["string"] = "GruvboxGreen",
			-- ["string.escape"] = "GruvboxGreen",
			["constant.builtin"] = "Constant", -- keep

			-- ["constant.macro"] = "TSKeyword", -- keep
			-- ["include"] = "TSKeyword", -- keep

			-- ["variable.builtin"] = "GruvboxAqua", -- keep

			-- this looks weird
			-- ["constructor"] = "GruvboxYellow", -- keep
			-- ["type"] = "GruvboxYellow", -- keep
			-- ["type.builtin"] = "GruvboxYellow", -- keep

			-- ["method"] = "GruvboxAqua", -- keep
			-- ["function"] = "GruvboxAqua", -- keep
			-- a python builtin function 'chr' was in orange instead of aqua
			-- ["function.builtin"] = "GruvboxAqua", -- keep

			-- ["include"] = "TSKeyword",
			-- ["operator"] = "TSKeyword",
			-- ["keyword.operator"] = "TSKeyword", -- keep

			-- ["punctuation.bracket"] = "TSNone", -- keep
			-- ["punctuation.special"] = "TSNone", -- keep
			-- ["punctuation.delimiter"] = "TSNone", -- keep

			-- ["variable.parameter"] = "TSParameter"
			-- ["parameter"] = "TSNone", -- for now -- keep

		}
	},
	refactor = {
		smart_rename = {
			enable = true,
			keymaps = { smart_rename = "<leader>r" }
		},
		navigation = {
			enable = true,
			-- keymaps = { goto_definition = "gd" }
		}
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>sn"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>sp"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]]"] = "@function.outer",
				["]c"] = "@class.outer",
			},
			goto_next_end = {
				["]["] = "@function.outer",
				["]C"] = "@class.outer",
			},
			goto_previous_start = {
				["[["] = "@function.outer",
				["[c"] = "@class.outer",
			},
			goto_previous_end = {
				["[]"] = "@function.outer",
				["[c"] = "@class.outer",
			},
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gns",
			node_incremental = "gni",
			node_decremental = "gnd",
			-- scope_incremental = "grc",
		},
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false -- Whether the query persists across vim sessions
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = {"BufWrite", "CursorHold"},
	},
	context_commentstring = {
		enable = true,
	},
}

-- in queries/lua/highlights.scm
-- ...
-- - (function [(function_name) (identifier)] @function)
-- + ; (function [(function_name) (identifier)] @function)
-- ...
-- (property_identifier) @property
-- (method) @method
--
-- + (function (function_name (identifier) @function))
-- + (function
-- + 	(function_name
-- + 		(function_name_field
-- + 			(identifier)
-- + 			. (property_identifier) @function))
-- + 	. (parameters))
-- ...
-- (function_call (field_expression (property_identifier) @function) . (arguments))
-- + (function_call (field_expression (property_identifier) @property) . (method) . (arguments))
-- + (function_call (field_expression) . (method) @function . (arguments))
