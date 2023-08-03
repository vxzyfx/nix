local util = require("lspconfig.util");
local handler = require("config.handler")
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      volar = {
	on_attach = handler.on_attach,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "vue", "css" })
      end
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        local nls = require("null-ls")
        vim.list_extend(opts.sources, {
          nls.builtins.code_actions.eslint,
          nls.builtins.formatting.eslint,
          nls.builtins.formatting.prettier,
          nls.builtins.diagnostics.eslint,
        })
      end
    end,
  },
}
