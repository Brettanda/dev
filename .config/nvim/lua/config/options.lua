-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Basic Vim Settings
local opt = vim.opt

opt.relativenumber = false
opt.autoindent = true
opt.smarttab = true
-- only set clipboard if not in ssh, to make sure the OSC 52
-- itegration works automatically.
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

local g = vim.g

g.python3_host_prog = "~/.virtualenvs/debugpy/bin/python"
g.autoformat = true
g.lazyvim_python_lsp = "pyright"
-- vim.g.lazyvim_python_lsp = "ruff"
