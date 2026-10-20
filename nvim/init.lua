require("config")

local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
  if file:match("%.lua$") then
    require("plugins." .. file:gsub("%.lua$", ""))
  end
end
