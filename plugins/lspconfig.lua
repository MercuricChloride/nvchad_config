local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "tsserver", "rls"}

lspconfig.solidity.setup({
  on_attach = on_attach, -- probably you will need this.
  capabilities = capabilities,
  settings = {
    -- example of global remapping
    solidity = {
        includePath = '',
        remapping = {
          ["@OpenZeppelin/"] = 'OpenZeppelin/openzeppelin-contracts@4.6.0/',
          ["forge-std/"] = 'lib/forge-std/src/',
          ["ds-test/"] = 'lib/forge-std/lib/ds-test/src/',
        }
    }
  },
})

for _, lsp in ipairs(servers) do

  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
