return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						-- You can optionally set descriptions to the mappings (used in the desc parameter of
						-- nvim_buf_set_keymap) which plugins like which-key display
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						-- You can also use captures from other query groups like `locals.scm`
						["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
					}
				}
			}
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
		keys = {
			{ "<c-space>", desc = "Increment Selection" },
			{ "<bs>",      desc = "Decrement Selection", mode = "x" },
		},
		auto_install = true,
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"printf",
			"python",
			"query",
			"regex",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}
