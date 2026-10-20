vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/joshdick/onedark.nvim",
  "https://github.com/zaldih/themery.nvim", -- selector de temas
})

vim.cmd.colorscheme("onedark")

require("themery").setup({
  themes = {
    "onedark",
    "tokyonight-night"
  },
  livePreview = true,
})

vim.keymap.set("n", "<leader>tt", "<cmd>Themery<CR>", {desc = "Selector de temas"})
