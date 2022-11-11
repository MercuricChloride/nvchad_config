-- custom/plugins/init.lua
-- we're basically returning a table!
return {

  -- Install plugin
  ["Pocco81/TrueZen.nvim"] = {},

  -- Override plugin definition options
  ["goolord/alpha-nvim"] = {
    disable = false,
    cmd = "Alpha",
  },

  -- Override plugin config
  ["williamboman/mason.nvim"] = {
    override_options = {
        ensure_installed = {
        "html-lsp",
        "clangd",
        "solc",
        "tsserver"
        }
      }
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
           require "custom.plugins.null-ls"
        end,
  },

   -- Override plugin config if it has a module called
   -- If you wish to call a module, which is 'cmp' in this case
   ["hrsh7th/nvim-cmp"] = {
    override_options = function()
      local cmp = require "cmp"

      return {
        mapping = {
          ["<C-d>"] = cmp.mapping.scroll_docs(-8),
        },
      }
    end,
  },
  -- remove plugin
  -- ["neovim/nvim-lspconfig"] = false
}
