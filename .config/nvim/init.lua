-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.options")
vim.cmd([[
	highlight Normal guibg=none
	highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])

-- vim.lsp.config("ruff", {
--   init_options = {
--      settings = {
--       -- Ruff language server settings go here
--     },
--   },
-- })

-- vim.lsp.enable("ruff")
