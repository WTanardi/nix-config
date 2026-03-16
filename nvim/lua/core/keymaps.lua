-- Keymaps

-- From kickstart
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Splits
vim.keymap.set("n", ",,", "<cmd>vs<CR>", { desc = "[,]Split" })
vim.keymap.set("n", ",h", "<C-w><C-h>", { desc = "Move focus to the left split" })
vim.keymap.set("n", ",l", "<C-w><C-l>", { desc = "Move focus to the right split" })
vim.keymap.set("n", ",j", "<C-w><C-j>", { desc = "Move focus to the lower split" })
vim.keymap.set("n", ",k", "<C-w><C-k>", { desc = "Move focus to the upper split" })

-- Quality of life
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "C-h", "C-w")
vim.keymap.set({ "v", "n" }, "<BSlash>", '"+y', { desc = "Yank to system clipboard" })

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "[w]rite file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "[q]uit file" })

vim.keymap.set("n", "<tab>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-tab>", "<cmd>bprev<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })

vim.keymap.set("n", "gn", "<C-o>", { desc = "[g]o [n]ext in jumplist" })
vim.keymap.set("n", "gb", "<C-i>", { desc = "[g]o [b]ack in jumplist" })
vim.keymap.set("n", "H", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set(
	"n",
	"<leader>oc",
	"<cmd>args `git ls-files --modified --others --exclude-standard`<CR>",
	{ desc = "[O]pen [C]hanges" }
)

vim.keymap.set("n", "<leader>t", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open File[t]ree" })
vim.keymap.set("n", "<leader>o", "<cmd>Oil --float<CR>", { desc = "Open [o]il" })
vim.keymap.set("n", "<leader>ld", "<cmd>Lazy<CR>", { desc = "Open [L]azy [D]ashboard" })
vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "[S]earch [T]odo" })
vim.keymap.set("n", "-", function()
	local MiniFiles = require("mini.files")
	local _ = MiniFiles.close() or MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
	vim.defer_fn(function()
		MiniFiles.reveal_cwd()
	end, 30)
end, { desc = "Open Mini Files" })

vim.keymap.set("v", "<leader>rs", ":s/\\v'[^']*'/string/g | nohlsearch<CR>", { desc = "[R]eplace [S]tring" })
vim.keymap.set("v", "<leader>rb", ":s/\\v<(true|false)>/boolean/g | nohlsearch<CR>", { desc = "[R]eplace [B]oolean" })
vim.keymap.set("v", "<leader>rn", ":s/\\v<\\d+(\\.\\d+)?>/number/g | nohlsearch<CR>", { desc = "[R]eplace [N]umber" })

vim.keymap.set(
	"n",
	"<leader>tr",
	"<cmd>TSToolsRemoveUnusedImports<CR> <BAR> <cmd>TSToolsOrganizeImports<CR>",
	{ desc = "Remove unused imports and organize them" }
)
