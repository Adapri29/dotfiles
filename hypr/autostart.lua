-- El antiguo "exec-once" es ahora un callback sobre el evento de arranque.
-- Todo lo que esté aquí dentro se lanza una sola vez, al iniciar Hyprland.
hl.on("hyprland.start", function()
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("swaync")                        -- Daemon para escuchar notificaciones
    hl.exec_cmd("elephant")
    hl.exec_cmd("walker --gapplication-service")
    hl.exec_cmd("waybar")
end)
