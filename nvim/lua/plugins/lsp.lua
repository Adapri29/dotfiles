
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
}

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {version = "LuaJIT"},
      workspace = {library = {vim.env.VIMRUNTIME}}
    },
  },
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

-- --- Autocompletado ----------------------------------
vim.opt.completeopt = {"menuone", "noselect", "popup"}

vim.api.nvim_create_autocmd("LspAttach",{
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
    end
  end,
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
