local M = {}

local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end
  navic.attach(client, bufnr)
end

local function attach_lsp_signature(client, bufnr)
  local status_ok, signature = pcall(require, "lsp_signature")
  if not status_ok then
    return
  end
  signature.on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded"
      }
    }, bufnr)
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>Telescope lsp_declarations<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gk", function() vim.lsp.buf.hover() end, opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", function() vim.diagnostic.open_float() end, opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", function() vim.lsp.buf.signature_help() end, opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "glf", function() vim.lsp.buf.format({ async = true }) end, opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<CR><CR>", function() vim.lsp.buf.code_action({ filter = function(a) return a.isPreferred end, apply = true }) end, opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space><CR>", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gln", function() vim.lsp.buf.rename() end, opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", function() vim.lsp.buf.type_definition() end, opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  attach_navic(client, bufnr)
  attach_lsp_signature(client, bufnr)
end

return M
