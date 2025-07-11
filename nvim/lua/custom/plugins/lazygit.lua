-- Lazygit integration

return {
	"kdheepak/lazygit.nvim",
	event = "VeryLazy",
	keys = {
		{
			"lg",
			":LazyGit<Return>",
			silent = true,
			noremap = true,
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
