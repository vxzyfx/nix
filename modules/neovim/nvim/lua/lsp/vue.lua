
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      volar = {},
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
}
