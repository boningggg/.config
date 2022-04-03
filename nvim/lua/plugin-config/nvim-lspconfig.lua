local ok_lsp, lspconfig = pcall(require, "lspconfig")

if not ok_lsp then
  vim.notify("[ERROR] Don't find the plugin 'nvim-lspconfig', please check 'plugins.lua'.")
  return
end

-- keymappings
local on_attach = require("keymappings").lsp_keymapping

-- Add additional capabilities supported by nvim-cmp
local ok_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not ok_cmp_nvim_lsp then
  vim.notify("[ERROR] Don't find plugin 'cmp_nvim_lsp', please check 'plugins.lua'.")
  return
end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- C, using clangd as server
lspconfig.clangd.setup {
  cmd = { "clangd" },
  on_attach = on_attach,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
}

