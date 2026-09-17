#!/bin/bash

#1: Vertical (con iconos), 0: Horizontal (texto)
MODE=${1:-1}

# Get RAM info
mem_info=$(free -h | awk '/^Mem:/ {print $3,$2}')
read -r mem_used mem_total <<< "$mem_info"
mem_percent=$(free | awk '/^Mem:/ {printf "%.0f", $3/$2 * 100}')

if command -v amdgpu_top &> /dev/null; then
    #Extraer datos de amdgpu_top
    metrics=$(amdgpu_top -i 0 --gpu-metrics | sed -n '/^#0/,/^#1/p')

    gpu_util=$(echo "$metrics" | grep "average_gfx_activity" | awk '{print $2}' | tr -d ',')
    temp=$(echo "$metrics" | grep "temperature_edge" | awk '{print $2}' | tr -d ',')
    power=$(echo "$metrics" | grep "average_socket_power" | awk '{print $2}' | tr -d ',')

    # Fallback por si amdgpu_top no devuelve datos (por ejemplo, si la GPU está apagada)
    gpu_util=${gpu_util:-0}
    temp=${temp:-0}
    power=${power:-0}

    #Formato visual
    if [ "$MODE" -eq 0 ]; then
	# Horizontal
	display_text="󰢮 ${gpu_util}%  ${temp}°C"
    else
	# Vertical (usando una barra simple de carga basada en %)
	chars=("󰪞" "󰪟" "󰪠" "󰪡" "󰪢" "󰪣" "󰪤" "󰪥")
	index=$(( gpu_util * 7 / 100 ))
	[ $index -gt 7 ] && index=7
	display_text="${chars[$index]}"
    fi

    # Tooltip detallado con Pango Markup
    tooltip="<b><span color='#fab387'><big>󰢮 Radeon RX 9060 XT</big></span></b>"
    tooltip+="\n<span color='#89dceb'>Uso:</span> <span color='#cdd6f4'>${gpu_util}%</span>"
    tooltip+="\n<span color='#89dceb'>Temp:</span> <span color='#cdd6f4'>${temp}°C</span>"
    tooltip+="\n<span color='#89dceb'>Consumo:</span> <span color='#cdd6f4'>${power}W</span>"

else
    # --- Fallback: Solo RAM ---
    if [ "$MODE" -eq 0 ]; then
        display_text="󰍛 ${mem_percent}%"
    else
        chars=("󰪞" "󰪟" "󰪠" "󰪡" "󰪢" "󰪣" "󰪤" "󰪥")
        idx=$(( mem_percent * 7 / 100 ))
        [ $idx -gt 7 ] && idx=7
        display_text="${chars[$idx]}"
    fi
    tooltip="<b><span color='#fab387'><big>󰍛 Memory</big></span></b>\n<span color='#89dceb'>RAM:</span> ${mem_used} / ${mem_total} (${mem_percent}%)"
fi

echo "{\"text\":\"$display_text\",\"tooltip\":\"$tooltip\"}"

