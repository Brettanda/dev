local null_ls = require("null-ls")

local opts = {
  sources = {
    -- null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    require("none-ls.formatting.ruff"),
  },
}
return opts
