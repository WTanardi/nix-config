return {
	"EtiamNullam/deferred-clipboard.nvim",
	config = function()
		require("deferred-clipboard").setup({
			fallback = "unnamed",
			lazy = true,
		})
	end,
}
