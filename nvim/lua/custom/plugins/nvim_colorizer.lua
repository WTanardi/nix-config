-- Nvim Colorizer to preview colors inline

return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		filetypes = { "*" },
		user_default_options = {
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = true, -- "Name" codes like Blue or red
			RRGGBBAA = true, -- #RRGGBBAA hex codes
			AARRGGBB = true, -- 0xAARRGGBB hex codes
			rgb_fn = true, -- CSS rgb() and rgba() functions
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			-- Highlighting mode. Options: 'background', 'foreground', 'virtualtext'
			mode = "background",
			-- Tailwinds support
			tailwind = true, -- Enable tailwind colors
			-- parsers can contain values used in |user_default_options|
			sass = { enable = true, parsers = { "css" } },
			virtualtext = "■",
		},
		-- all the sub-options of filetypes apply to buftypes
		buftypes = {},
	},
}
