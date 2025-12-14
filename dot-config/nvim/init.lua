vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.undofile = true
vim.opt.shiftwidth = 4

require("config.lazy")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- vim.keymap.set("n", "<leader>t", ":ToggleTerm dir=%:p:h:h<CR>", { desc = "ToggleTerm in parent directory of current file" })
-- vim.keymap.set("t", "<leader>t", [[<C-\><C-n>:hide<CR>]])

vim.api.nvim_set_keymap("n", "<leader>r", ":RnvimrToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "Q", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
