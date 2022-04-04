-- Include the servers you want to have installed by default below
local servers = {
  clangd = require("lsp.clangd"), -- for C
  jdtls = require("lsp.jdtls"), -- for Java
}

for name, opts in pairs(servers) do
  opts.on_attach = require("keymappings").lsp_keymapping
  opts.flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
  }
  opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require('lspconfig')[name].setup(opts)
end
