local on_attach = function(client, bufnr)
  local handler = require("config.handler")
  local rt = require("rust-tools")
  local wk = require("which-key")
  wk.register({
    d = {
      d = { rt.debuggables.debuggables, "Debug"},
    },
    r = {
      name = "rust",
      h = { rt.hover_actions.hover_actions, "Hover"},
      o = { rt.inlay_hints.set, "Set inlay hints"},
      p = { rt.inlay_hints.unset, "Unset inlay hints"},
      e = { rt.inlay_hints.enable, "Enable inlay hints"},
      d = { rt.inlay_hints.disable, "Disable inlay hints"},
      r = { rt.runnables.runnables, "Runable"},
      m = { rt.expand_macro.expand_macro, "ExpandMacro"},
      j = { function() rt.move_item.move_item(false) end, "Move down"},
      k = { function() rt.move_item.move_item(true) end, "Move down"},
    },
  }, { buffer = bufnr, prefix = "<leader>"})
  -- wk.register(keys, {buffer=bufnr, prefix="<leader>"})
  handler.on_attach(client, bufnr)
end

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = true,
      },
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "crates" },
      }))
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml" })
      end
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    opts = function()
      local extension_path = '/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb'
      local this_os = vim.loop.os_uname().sysname
      liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
      return {
        dap = {
          adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        tools = {
	        -- executor = require("rust-tools.executors").termopen,
	        reload_workspace_from_cargo_toml = true,
          inlay_hints = {
            only_current_line = false,
            auto = true,
            only_current_line_autocmd = "CursorHold",
            show_parameter_hints = true,
            show_variable_name = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
          },
          hover_actions = {
            auto_focus = false,
            border = "rounded",
            width = 60,
          },
        },
        server = {
          on_attach = on_attach,
        },
      }
    end
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "rouge8/neotest-rust",
    },
    opts = {
      adapters = {
        ["neotest-rust"] = {},
      },
    },
  },
}
