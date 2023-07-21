return {
  {
    "neovim/nvim-lspconfig",
    opts = {},
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, opt in pairs(opts) do
        lspconfig[server].setup(opt)
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
    end
  },
}
