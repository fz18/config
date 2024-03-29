local M = {}

M.getData = function()
  return vim.fn.stdpath("data")
end

M.getConfig = function()
  return vim.fn.stdpath("config")
end

M.getCache = function()
  return vim.fn.stdpath("cache")
end

M.join = function(...)
  local path_sep = "/"
  return table.concat({ ... }, path_sep)
end

return M

