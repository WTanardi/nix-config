-- Lazygit integration

return {
	"kdheepak/lazygit.nvim",
	keys = {
		{
			"<leader>lg",
			":LazyGit<Return>",
			silent = true,
			noremap = true,
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
