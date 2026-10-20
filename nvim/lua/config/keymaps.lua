local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", {desc = "Quitar resaltado de búsqueda"})

-- Moverse entre ventanas con Ctrl + h/j/k/l
map("n", "<C-h>", "<C-w>h", {desc = "Ventana izquierda"})
map("n", "<C-j>", "<C-w>j", {desc = "Ventana abajo"})
map("n", "<C-k>", "<C-w>k", {desc = "Ventana arriba"})
map("n", "<C-l>", "<C-w>l", {desc = "Ventana derecha"})

-- Mover líneas seleccionadas arriba/abajo en modo visual
map("v", "J", ":m '>+1<CR>gv=gv", {desc = "Bajar selección"})
map("v", "K", ":m '<-2<CR>gv=gv", {desc = "Subir selección"})

