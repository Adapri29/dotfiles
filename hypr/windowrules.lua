hl.window_rule({
    name  = "pwvucontrol",
    match = { class = "com.saivert.pwvucontrol" },

    float  = true,
    size   = { 900, 600 },
    center = true,
})

-- ---------------------------------------------------------------------
-- Cities: Skylines II  (Proton / XWayland)
--
-- El juego dibuja su propio cursor dentro del frame renderizado, asi que la
-- latencia del puntero y de los resaltados de hover es, en la practica, la
-- latencia de composicion. Marcando la ventana como opaca, Hyprland deja de
-- necesitar el paso de blur detras de ella y puede tratarla como "solitary",
-- que es el requisito para el scanout directo (render.direct_scanout, en
-- decorations.lua). Eso ahorra un frame entero de retardo.
--
-- Descomenta "immediate" si quieres permitir tearing: baja mas la latencia
-- a cambio de posibles cortes horizontales en movimientos de camara rapidos.
-- Requiere ademas general.allow_tearing en decorations.lua.
-- ---------------------------------------------------------------------
hl.window_rule({
    name  = "cities-skylines-2",
    match = { class = "steam_app_949230" },

    opaque   = true,
    rounding = 0,
    -- immediate = true,
})
