
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})

vim.pack.add({
  "https://github.com/obsidian-nvim/obsidian.nvim"
})

require("obsidian").setup({
  legacy_commands = false,
  workspaces = {
    {name = "novela", path = "~/Proyectos/novela"}
  },
  ui = {enable = false},
})
