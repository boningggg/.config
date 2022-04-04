local lsp_installer = require("nvim-lsp-installer")

-- Include the servers you want to have installed by default below
local servers = {
  clangd = require("lsp.clangd"), -- for C
  jdtls = require("lsp.jdtls"), -- for Java
}

for name, opts in pairs(servers) do
  local available, server = lsp_installer.get_server(name)
  
  if not available then
    vim.nofity(name .. "is not available. Please check or use another server.")
  elseif not server:is_installed() then
    vim.notify("Installing Server: " .. name)
    server:install()
  else -- Server is installed
    server:on_ready(
      function()
        -- Keymappings
        opts.on_attach = require("keymappings").lsp_keymapping
        -- Add additional capabilities supported by nvim-cmp
        opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
        opts.flags = {
           -- This will be the default in neovim 0.7+
          debounce_text_changes = 150,
        }
        -- Setup options
        server:setup(opts)
      end
    )
  end
end
