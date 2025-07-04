-- Keymaps

-- From kickstart
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
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
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "[w]rite file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "[q]uit file" })
vim.keymap.set("n", "<leader>t", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open File[t]ree" })
vim.keymap.set("n", "<tab>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-tab>", "<cmd>bprev<CR>", { desc = "Previous Buffer" })
vim.keymap.set({ "v", "n" }, "<BSlash>", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>ld", "<cmd>Lazy<CR>", { desc = "Open [L]azy [D]ashboard" })
vim.keymap.set("n", "gn", "<C-o>", { desc = "[g]o [n]ext in jumplist" })
vim.keymap.set("n", "gb", "<C-i>", { desc = "[g]o [b]ack in jumplist" })

-- FZF Lua mappings
-- vim.keymap.set("n", "<leader><leader>", require("fzf-lua").files, { desc = "Find files" })
-- vim.keymap.set("n", "<leader>sg", require("fzf-lua").live_grep, { desc = "[s]earch [g]rep" })
-- vim.keymap.set("n", "<leader>sk", require("fzf-lua").Keymaps, { desc = "[s]earch [k]eymaps" })
