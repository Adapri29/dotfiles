import QtQuick
import qs.services
import qs.components

MaterialIcon{
  id: root

  icon: Network.ethernet ? "settings_ethernet"
        : !Network.wifiEnabled ? "wifi_off" 
        : !Network.connected ? "wifi_add"
        : Network.strength < 0.33 ? "wifi_1_bar"
        : Network.strength < 0.66 ? "wifi_2_bar"
        : "wifi"
  pixelSize: 19
  color: Network.wifiEnabled ? Theme.text : Theme.textDim

  HoverHandler{
    id: hover
    margin: 5
  }

  Tooltip{
    target: root
    text: Network.ethernet ? "Cable" : Network.ssid || "Sin conexión"
    shown: hover.hovered
  }
}
