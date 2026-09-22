#!/usr/bin/env bash
# Cambia de workspace con la rueda del ratón (arriba = anterior, abajo = siguiente).
#
# Hyprland corre en modo config Lua, así que el IPC espera código Lua:
# la sintaxis clásica "hyprctl dispatch workspace e+1" falla con error de sintaxis.
#
# Toda la lógica va dentro de un único `hyprctl eval`, que Hyprland evalúa de forma
# atómica. Leer el workspace activo desde bash (hyprctl activeworkspace) devuelve
# valores obsoletos al hacer scroll rápido y se pierden eventos.
#
# El rango 1..5 coincide con persistent-workspaces de config.jsonc. Hace tope en
# los extremos, sin wrap y sin crear workspaces fuera del rango.
MIN=1
MAX=5

case "$1" in
    up)   cond="c > $MIN";  step="c - 1" ;;
    down) cond="c < $MAX";  step="c + 1" ;;
    *)    echo "uso: $(basename "$0") up|down" >&2; exit 1 ;;
esac

hyprctl eval "local c = hl.get_active_workspace().id
              if $cond then hl.dispatch(hl.dsp.focus({workspace = $step})) end"
