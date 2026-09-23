-- =====================================================================
-- CURSOR
-- =====================================================================

-- Tamaño del cursor en píxeles. Estándar para escala 1:1.
-- Si usas scale = 2 en monitors.lua, cambiar a 48.
hl.env("XCURSOR_SIZE", "24")

-- Tema del cursor. Sin esto, apps bajo XWayland ignoran el tema
-- del sistema y muestran el cursor X11 por defecto.
hl.env("XCURSOR_THEME", "Adwaita")

-- =====================================================================
-- GTK (Nautilus, GIMP, apps GTK3/GTK4)
-- =====================================================================

-- Backend de display para apps GTK, en orden de preferencia.
-- Intenta Wayland nativo primero; si falla, cae a X11 (XWayland).
hl.env("GDK_BACKEND", "wayland,x11")

-- =====================================================================
-- QT (apps Qt5/Qt6)
-- =====================================================================

-- Backend de display para apps Qt. Separador ; en lugar de ,
-- wayland = nativo | xcb = X11 como fallback
hl.env("QT_QPA_PLATFORM", "wayland;xcb")

-- Desactiva decoraciones de ventana del lado del cliente en Qt.
-- Sin esto algunas apps Qt dibujan su propia barra de título
-- además de la que pinta Hyprland → decoraciones dobles.
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Gestor de temas para apps Qt fuera de un entorno KDE completo.
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- =====================================================================
-- SDL (juegos nativos Linux, emuladores)
-- =====================================================================

-- Fuerza el backend Wayland en SDL2/SDL3.
-- Para juegos que fallen, sobreescribir individualmente en Steam:
--   SDL_VIDEODRIVER=x11 %command%
hl.env("SDL_VIDEODRIVER", "wayland,x11")

-- =====================================================================
-- ELECTRON (Obsidian, VSCode, Discord...)
-- =====================================================================

-- Activa Wayland nativo en apps Electron si está disponible.
-- Sin esto la mayoría corre bajo XWayland aunque soporten Wayland.
-- Valores: auto (decide según entorno) | wayland (forzado)
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- En hyprlang esto era "$HOME/...", expandido por el propio Hyprland.
-- En Lua la expansión la haces tú: os.getenv da el valor real.
hl.env("XDG_DATA_DIRS", os.getenv("HOME") .. "/.local/share/flatpak/exports/share"
    .. ":/var/lib/flatpak/exports/share:/usr/local/share:/usr/share")

-- =====================================================================
-- GPU (multi-GPU: iGPU Granite Ridge + RX 9060 XT)
-- =====================================================================

-- Fija Aquamarine a la GPU dedicada, que es la que tiene el monitor
-- colgado (card1-HDMI-A-2). Sin esto el compositor enumera las dos y
-- puede reservar los buferes en la iGPU: al compartirlos entre GPUs
-- distintas falla la fijacion DMA-BUF, xdg-desktop-portal-hyprland cae
-- a SHM y se queda en "Out of buffers" -> OBS no recibe ni un frame.
-- Ruta by-path en lugar de /dev/dri/card1 porque la numeracion de card
-- puede bailar entre arranques; el PCI no.
-- OJO: AQ_DRM_DEVICES separa dispositivos con ":", y la ruta by-path
-- (pci-0000:03:00.0-card) los contiene -> Aquamarine la trocea, no
-- encuentra ninguna GPU y Hyprland aborta. Por eso se apunta a un
-- symlink sin ":" (hypr/dgpu -> /dev/dri/by-path/pci-0000:03:00.0-card).
hl.env("AQ_DRM_DEVICES", os.getenv("HOME") .. "/.config/hypr/dgpu")
