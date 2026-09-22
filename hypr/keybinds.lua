-- Tecla modificadora principal
local mod = "SUPER"

-- ====================================================================
-- ACCIONES GENERALES
-- ====================================================================

hl.bind(mod .. " + Return", hl.dsp.exec_cmd("kitty"))                        -- Abrir terminal
hl.bind(mod .. " + Q", hl.dsp.window.close())                                -- Cerrar ventana activa
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))      -- Pantalla completa
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))           -- Ventana flotante
hl.bind(mod .. " + Space", hl.dsp.exec_cmd("walker"))                        -- Lanzador de aplicaciones
hl.bind(mod .. " + SHIFT + E", hl.dsp.exit())                                -- Cerrar sesión Hyprland

-- ====================================================================
-- FOCO (HJKL — estilo vim)
-- ====================================================================

hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))   -- Foco a la izquierda
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))  -- Foco a la derecha
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))     -- Foco arriba
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))   -- Foco abajo

-- ====================================================================
-- MOVER VENTANAS
-- ====================================================================

hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))   -- Mover ventana a la izquierda
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))  -- Mover ventana a la derecha
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))     -- Mover ventana arriba
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))   -- Mover ventana abajo

-- Mover / redimensionar con el ratón. El flag mouse = true es lo que
-- sustituye al antiguo "bindm".
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })       -- Click izquierdo: mover
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })     -- Click derecho: redimensionar

-- ====================================================================
-- WORKSPACES
-- ====================================================================

-- Cambiar al workspace N y mover la ventana activa al workspace N.
-- El bucle genera los 6 pares; equivale a las 12 líneas que tenías.
for i = 1, 6 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Mover ventana al workspace anterior/siguiente (relativo)
hl.bind(mod .. " + SHIFT + left", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ workspace = "+1" }))

-- ====================================================================
-- AUDIO (teclas multimedia — sin modificador)
-- ====================================================================

-- wpctl opera sobre PipeWire. @DEFAULT_AUDIO_SINK@ = salida activa.
-- locked = true las mantiene activas con la pantalla bloqueada.
-- repeating = true permite dejar la tecla pulsada para subir/bajar.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })                                      -- Subir volumen
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })                                      -- Bajar volumen
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true })                                                        -- Silenciar salida
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true })                                                        -- Silenciar micrófono

-- ====================================================================
-- CAPTURA DE PANTALLA
-- ====================================================================

-- exec_cmd lanza con sh -c, así que las tuberías funcionan igual que antes.
hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy"))                              -- Captura de pantalla completa
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("slurp | grim -g - - | wl-copy"))   -- Captura de un área seleccionada
