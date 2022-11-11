local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "tsserver", "rls"}

-- solidity manual config
lspconfig.solidity.setup({
  on_attach = on_attach,
  capabilities=capabilities,
  settings = {
    solidity = { includePath = '', remapping = {
      ["@OpenZeppelin/"] = 'OpenZeppelin/openzeppelin-contracts@4.6.0/',
      ["ds-test/"] = "lib/forge-std/lib/ds-test/src",
      }
    }
  }
})
--ds-test/=lib/forge-std/lib/ds-test/src/
--forge-std/=lib/forge-std/src/

for _, lsp in ipairs(servers) do

  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
