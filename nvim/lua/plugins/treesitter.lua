vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then vim.cmd.packadd("nvim") end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

-- Lenguajes a instalar
-- Ver todos los disponible: :lua print(vim.inspect(require("nvim-treesitter").get_available()))
require("nvim-treesitter").install({
  "rust", "toml", -- Rust y Cargo.toml
  "glsl",
  "lua",
  "bash",
  "json",
  "python",
})

-- Activa el resaltado en cualquier archivo cuyo lenguaje tenga parser
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
