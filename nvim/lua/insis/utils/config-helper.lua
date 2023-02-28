local M = {}

M.getMasonConfig = function()
  local cfg = require("insis").config
  -- all supported lsp server for now
  -- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
  -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
  local configMap = {
    lua_ls = require("insis.lsp.config.lua"), -- lua/lsp/config/lua.lua
  }

  -- enabled lsp server map
  -- key : lspconfig server name
  -- vale: lsp config file
  local servers = {}
  -- linter and formatter ensure list
  local toolList = {}

  local ensureTool = function(tool)
    if table.indexOf(toolList, tool) == -1 then
      table.insert(toolList, tool)
    end
  end

  if cfg.lua and cfg.lua.enable then
    if configMap[cfg.lua.lsp] then
      -- lua_ls
      servers[cfg.lua.lsp] = configMap[cfg.lua.lsp]
    end
    if cfg.lua.formatter == "stylua" then
      ensureTool("stylua")
    end
  end
   -- mason lsp ensure list
  local lspList = {}
  for key, _ in pairs(servers) do
    table.insert(lspList, key)
  end
  -- log(servers)
  return lspList, servers, toolList
end

return M
