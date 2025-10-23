return {
  "nvimtools/none-ls.nvim",
  event = "LazyFile",
  dependencies = { "mason.nvim" },
  -- init = function()
  -- LazyVim.on_very_lazy(function()
  -- register the formatter with LazyVim
  -- LazyVim.format.register({
  -- name = "none-ls.nvim",
  -- priority = 200, -- set higher than conform, the builtin formatter
  -- primary = true,
  -- format = function(buf)
  -- return LazyVim.lsp.format({
  -- bufnr = buf,
  -- filter = function(client)
  -- return client.name == "null-ls"
  -- end,
  -- })
  -- end,
  -- sources = function(buf)
  -- local ret = require("null-ls.sources").get_available(vim.bo[buf].filetype, "NULL_LS_FORMATTING") or {}
  -- return vim.tbl_map(function(source)
  -- return source.name
  -- end, ret)
  -- end,
  -- })
  -- end)
  -- end,
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.diagnostics.proselint,
      nls.builtins.code_actions.proselint,
      nls.builtins.diagnostics.alex,
      nls.builtins.diagnostics.prettierd,
      nls.builtins.formatting.prettierd.with({
        extra_filetypes = { "svelte", "vue" },
        extra_args = function(params)
          return params.options
            and params.options.tabSize
            and {
              "--tab-width",
              params.options.tabSize,
            }
        end,
      }),
      nls.builtins.diagnostics.write_good.with({
        filetypes = { "markdown", "text", "gitcommit" }, --, "python" },
        --
        -- maybe i don't want this anymore for python files
        -- filter = function(diagnostic)
        -- Only keep diagnostics if they’re inside comments or docstrings
        -- local row = tonumber(diagnostic.row)
        -- if not row then
        -- return false
        -- end
        -- local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
        -- return line:match("^%s*#") or line:match('"""') or line:match("'''")
        -- end,
      }),
    })
    -- opts.write_good = {
    -- FIXME: this doesn't work and im sad that i cant get it to work with python comments :(
    -- filetypes = { "markdown", "text", "gitcommit", "python" },
    -- filter = function(diagnostic)
    -- local row = diagnostic.row
    -- local line = vim.api.nvim_buf_get_lines(9, row - 1, row, false)[1]
    -- return line:match("^%s*#") or line:match('"""') or line:match("'''")
    -- end,
    -- settings = { thereIs = true },
    -- }
  end,
}
