return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.format_notify = true
    opts.servers.lua_ls = {}
    opts.servers.dockerls = {}
    opts.servers.ruff = {
      init_options = {
        settings = {
          args = {
            "--config=~/pyproject.toml",
          },
          lineLength = 180,
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
      filetypes = { "json", "jsonc", "jsonl" },
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
    -- opts.servers.vue_ls = {}
    opts.servers.volar = {
      filetypes = { "vue" },
      init_options = {
        vue = {
          hybridMode = false,
        },
      },
      -- settings = {
      -- typescript = {

      -- }
      -- }
    }

    opts.servers.tailwindcss = {}
  end,
}
