-- Requiere fzf, ripgrep y fd

vim.pack.add({
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/nvim-tree/nvim-web-devicons",
})

local fzf = require("fzf-lua")
fzf.setup({})

-- Dentro del buscador: escribe para filtrar Ctrl+j/k moverse Enter abrir
-- Ctrl + v abrir en split vertical Ctrl+s abrir en split horizontal
local map = vim.keymap.set
map("n", "<leader>ff", fzf.files, {desc = "Buscar archivos"})
map("n", "<leader>fg", fzf.live_grep, {desc = "Buscar texto en proyecto"})
map("n", "<leader>fw", fzf.grep_cword, {desc = "Buscar la palabra bajo el cursor"})
map("n", "<leader>fb", fzf.buffers, {desc = "Buscar entre archivos abiertos"})
map("n", "<leader>fr", fzf.oldfiles, {desc = "Archivos recientes"})
map("n", "<leader>fh", fzf.help_tags, {desc = "Buscar en la ayuda"})
map("n", "<leader>fk", fzf.keymaps, {desc = "Buscar atajos"})
map("n", "<leader>fd", fzf.diagnostics_document, {desc = "Errores del archivo"})
