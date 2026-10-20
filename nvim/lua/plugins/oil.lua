vim.pack.add({
  "https://github.com/stevearc/oil.nvim"
})

require("oil").setup({
  default_fire_explorer = true,
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["<C-h>"] = false,
    ["<C-l>"] = false,
  },
})

vim.keymap.set("n", "-", "<cmd>Oil<CR>", {desc = "Abrir carpeta (oil)"})
