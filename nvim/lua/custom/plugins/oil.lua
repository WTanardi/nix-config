return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
	},
	config = function()
		require("oil").setup({
			columns = {
				"icon",
			},

			use_default_keymaps = false,

			keymaps = {
				["q"] = "actions.close",
				["h"] = "actions.parent",
				["l"] = "actions.select",
				["_"] = "actions.open_cwd",
				["?"] = "actions.show_help",
				["<C-r>"] = "actions.refresh",
				["<C-p>"] = "actions.preview",
				["g."] = "actions.toggle_hidden",

				["="] = {
					callback = function()
						vim.cmd.write()
					end,
					desc = "Write buffer modifications to disk",
					mode = "n",
				},

				view_options = {
					sort = {
						{ "type", "asc" },
						{ "name", "asc" },
						float = {
							padding = 10,
							max_width = 0,
							max_height = 0,
							border = "rounded",
							win_options = {
								winblend = 0,
							},
						},
					},
				},
			},
		})
	end,
}
