
vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
})

-- --- Servidores ---------------------------------------
local servers = {
  rust_analyzer = "rust_analyzer",
  taplo = "taplo", -- TOML
  glsl_analyzer = "glsl_analyzer",
  pyright = "pyright_langserver",
  lua_ls = "lua-language-server",
  bashls = "bash-language-server",
  jsonls = "vscode-json-language-server",
  qmlls = "/usr/lib/qt6/bin/qmlls",
}

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {version = "LuaJIT"},
      workspace = {library = {vim.env.VIMRUNTIME}}
    },
  },
})

vim.lsp.config("qmlls", {
  cmd = {"/usr/lib/qt6/bin/qmlls"}
})
 
for name, bin in pairs(servers) do
  if vim.fn.executable(bin) == 1 then
    vim.lsp.enable(name)
  end
end


-- --- Diagnósticos ------------------------------------
vim.diagnostic.config({
  virtual_text = true, -- muestra el error al final de la línea
  severity_sort = true, -- errores antes que avisos
})

-- --- Atajos -----------------------------------------
-- K documentación 
-- grn renombrar
-- grr referencias
-- gra acciones de código
-- gri impleentación
-- grt definición del tipo
-- Ctrl+] ir a la definición de la función
-- Ctrl+s firma de la función
-- [d ]d diagnostico ant./sig
-- Ctrl+w d ver 
