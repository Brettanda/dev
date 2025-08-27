-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Basic Vim Settings
local opt = vim.opt

opt.relativenumber = false
opt.autoindent = true
opt.smarttab = true

vim.g.python3_host_prog = "~/.virtualenvs/debugpy/bin/python"
