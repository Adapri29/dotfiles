import QtQuick
import qs.services
import qs.components

Text{
  id: root
  text: Network.ethernet ? "\u{ef44}"
        : !Network.wifiEnabled ? "\u{f092d}" 
        : !Network.connected ? "\u{f092f}"
        : Network.strength < 0.25 ? "\u{f091f}"
        : Network.strength < 0.5 ? "\u{f0922}"
        : Network.strength < 0.75 ? "\u{f0925}"
        : "\u{f0928}"
  font.family: "Symbols Nerd Font"
  font.pixelSize: 15
  color: Network.connected ? "#FFFFFF" : Qt.rgba(0.5, 0.5, 0.5 , 1)

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
