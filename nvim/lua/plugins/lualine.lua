vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff", "diagnositcs"},
    lualine_c = {{"filename", path = 1, file_status = 1}},
    lualine_x = {"filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"},
  }
})
