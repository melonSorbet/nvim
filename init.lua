require("sorbet")

vim.cmd("source ~/.config/nvim/vimfiles/init.vim")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.cmd("colorscheme kanagawa")
vim.opt.swapfile = false



vim.opt.relativenumber = true;
vim.opt.nu = true;
vim.opt.termguicolors = true;
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
