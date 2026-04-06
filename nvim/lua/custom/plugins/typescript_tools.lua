return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {
		separate_diagnostic_server = true,
		publish_diagnostic_on = "insert_leave",
		settings = {
			expose_as_code_action = {},

			tsserver_file_preferences = {
				includeInlayParameterNameHints = "none",
				includeInlayVariableTypeHints = false,
				includeCompletionsForModuleExports = false,
			},

			tsserver_format_options = {
				allowIncompleteCompletions = false,
			},

			tsserver_max_memory = 8192,
		},
	},
}
