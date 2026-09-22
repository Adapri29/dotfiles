-- Los colores vienen de colors.lua, que genera matugen.
-- En hyprlang eran variables $primary / $surface; en Lua es un módulo.
local colors = require("colors")

hl.config({
    general = {
        gaps_in     = 4,
        gaps_out    = 8,
        border_size = 2,
        layout      = "dwindle",

        col = {
            active_border   = colors.primary,
            inactive_border = colors.surface,
        },
    },

    decoration = {
        rounding = 8,
    },

    -- Envia la ventana en pantalla completa directamente al escaner de video,
    -- saltandose la composicion. Estaba en 0 ("user settings" aparecia como
    -- motivo en directScanoutBlockedBy de hyprctl monitors).
    render = {
        direct_scanout = 1,
    },
})

-- Necesario solo si activas "immediate" en alguna windowrule.
-- hl.config({
--     general = {
--         allow_tearing = true,
--     },
-- })
