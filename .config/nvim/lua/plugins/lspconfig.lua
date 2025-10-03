return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.format_notify = true
    opts.servers.lua_ls = {}
    opts.servers.dockerls = {}
    opts.servers.ruff = {
      init_options = {
        settings = {
          lineLength = 110,
        },
      },
    }

    opts.servers.basedpyright = {
      filetypes = { "python" },
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "standard",
            -- ignore = { "*" },
            -- autoSearchPaths = true,
            -- diagnosticMode = "workspace",
          },
        },
      },
    }

    opts.servers.jsonls = {
      filetypes = { "json" },
      settings = {
        json = {
          format = {
            enable = true,
          },
          validate = { enable = true },
        },
      },
    }

    -- opts.servers.dotls = {
    -- cmd = { "dot-language-server", "--stdio" },
    -- filetypes = { "dot" },
    -- root_dir = function(fname)
    -- return require("lspconfig.util").root_pattern(".git")(fname) or require("lspconfig.util").path.dirname(fname)
    -- end,
    -- }

    -- opts.servers.writegood = {
    -- filetypes = { "markdown", "text", "gitcommit" },
    -- settings = {},
    -- }
  end,
}
