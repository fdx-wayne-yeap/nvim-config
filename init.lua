require("config.lazy")

vim.o.sw = 4
vim.o.et = true
vim.o.number = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<Leader>cd", ":lua vim.diagnostic.open_float()<CR>", { desc = "Open floating diagnostics" })
