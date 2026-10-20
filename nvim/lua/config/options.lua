--- Tecla líder --------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- Interfaz -----------------------------------
vim.opt.number = true  -- número de línea
vim.opt.relativenumber = true -- números relativos
vim.opt.cursorline = true -- resalta línea actual
vim.opt.scrolloff = 8 -- deja 8 líneas de margen al desplazarse
vim.opt.wrap = false -- no parte las líneas largas

--- Identación ---------------------------------
vim.opt.expandtab = true -- Tab inserta espacios
vim.opt.tabstop = 2 -- ancho visual de un tab
vim.opt.shiftwidth = 2 -- espacios al indentar con > y <
vim.opt.smartindent = true -- indenta automáticamente

--- Búsqueda -----------------------------------
vim.opt.ignorecase = true -- ignora mayúsculas al buscar
vim.opt.smartcase = true -- salvo que escribas alguna

--- Comportamiento -----------------------------
vim.opt.mouse = "a" -- ratón en todos los modos
vim.opt.clipboard = "unnamedplus" -- clipboard del sistema (requiere wl-clipboard)
vim.opt.undofile = true -- guarda el historial de deshacer entre sesiones
vim.opt.swapfile = false -- sin archivos .swp



