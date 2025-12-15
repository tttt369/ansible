vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.undofile = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 4

require("config.lazy")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<Esc>", ":noh<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.api.nvim_set_keymap("n", "<leader>h", ":HopWordCurrentLineAC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>H", ":HopWordCurrentLineBC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>r", ":RnvimrToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "Q", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
