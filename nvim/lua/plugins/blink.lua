
vim.pack.add({
  {src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*")},
  "https://github.com/rafamadriz/friendly-snippets",
})

require("blink.cmp").setup({
  -- Atajos
  -- Ctrl + espacio abrir 
  -- Ctrl+n/Ctrl+p moverse
  -- Ctrl+y aceptar
  -- Ctrl+e cerrar
  -- Tab / Shift+Tab saltar entre los huecos de un snippet
  -- Otros peresets: "super-tab" (aceptar con Tab), "enter" (aceptar con Enter)
  
  keymap = {preset = "super-tab"},
  appearance = {
    nerd_font_variant = "mono"
  },
  completion = {
    documentation = {auto_show = true, auto_show_delay_ms = 300},
  },  
  signature = {enabled = true}, -- muestra los parámetros al escribir una función
  sources = {
    default = {"lsp", "path", "snippets", "buffer"},
  },

  -- Usa el buscador en Rust; si no esta disponible el de Lua
  fuzzy = {implementation = "prefer_rust_with_warning"},
})
