local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt,
  b.formatting.prettier,

  -- solidity stuff
  -- b.diagnostics.solhint,

  -- Lua
  b.formatting.stylua,
}

null_ls.setup {
   debug = false,
   sources = sources,
}
