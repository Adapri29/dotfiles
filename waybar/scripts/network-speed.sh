#!/bin/bash

iface=$(ip route | awk '/default/ {print $5; exit}')
rx1=$(cat /sys/class/net/$iface/statistics/rx_bytes)
tx1=$(cat /sys/class/net/$iface/statistics/tx_bytes)
sleep 2
rx2=$(cat /sys/class/net/$iface/statistics/rx_bytes)
tx2=$(cat /sys/class/net/$iface/statistics/tx_bytes)

down=$(( (rx2 - rx1) / 2 / 1024 ))
up=$(( (tx2 - tx1) / 2 / 1024 ))

# Siempre 4 dígitos con padding
printf '{"text": "󰇚 %4d KB/s 󰕒 %4d KB/s"}' $down $up
