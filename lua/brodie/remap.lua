vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Moving between panels
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Show diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostics" })

-- Clear highlighting after searching for a word
vim.keymap.set("n", "<leader>n", ":nohlsearch<CR>", { desc = "vim.nohlsearch<CR>No highlighting" })
