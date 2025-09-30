return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers.ruff = {
      init_options = {
        settings = {
          lineLength = 110,
        },
      },
    }

    opts.servers.basedpyright = {
      settings = {
        basepyright = {
          analysis = {
            -- typeCheckingMode = "basic",
            ignore = { "*" },
          },
        },
      },
    }
  end,
}
