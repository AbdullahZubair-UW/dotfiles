-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Plug>IMAP_JumpForward", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<Plug>IMAP_JumpForward", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>[s1z=`^a", { noremap = true, silent = true })
