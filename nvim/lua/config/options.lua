-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.spell = true
vim.opt.undofile = true
vim.opt.backup = true
vim.opt.spelllang = { "en_us" }
vim.opt.spellfile = vim.fn.expand("~/.vim/spell/en.utf-8.add")
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")
vim.opt.backupdir = vim.fn.expand("~/.local/share/nvim/backup")
