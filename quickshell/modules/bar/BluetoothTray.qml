import QtQuick
import qs.services
import qs.components
import QtQuick.Layouts

Text{
  id: root

  readonly property color accent: "#F2A594"
  readonly property color muted: Qt.rgba(1, 1, 1, 0.5)
  readonly property string iconFont: "Symbols Nerd Font"

  function iconFor(device) {
      switch (device.icon) {
      case "input-gaming":     return "\u{f0297}"
      case "phone":            return "\u{f011c}"
      case "audio-headset":
      case "audio-headphones": return "\u{f02cb}"
      case "input-mouse":      return "\u{f037d}"
      case "input-keyboard":   return "\u{f030c}"
      default:                 return "\u{f00af}"
      }
  }

  text: !Bluetooth.enabled ? "\u{f00b2}" : "\u{f00af}"
  font.family: iconFont
  font.pixelSize: 15
  color: "#FFFFFF"

  HoverHandler{
    id: hover
    margin: 5 
  }

  TapHandler{
    margin: 5
    onTapped: Bluetooth.toggle()
  }

  Tooltip{
    target: root
    shown: hover.hovered
    padding: 14

    ColumnLayout {
      width: 260
      spacing: 6

      // Cabecera: icono, título y estado
      RowLayout {
          spacing: 8

          Text {
              text: Bluetooth.enabled ? "\u{f00af}" : "\u{f00b2}"
              font { family: root.iconFont; pixelSize: 18 }
              color: Bluetooth.enabled ? root.accent : root.muted
          }
          Text {
              text: "Bluetooth"
              font { pixelSize: 15; bold: true }
              color: "white"
          }
          Item { Layout.fillWidth: true }
          Text {
              text: Bluetooth.enabled ? "Encendido" : "Apagado"
              font.pixelSize: 12
              color: Bluetooth.enabled ? root.accent : root.muted
          }
      }

      Text {
          text: Bluetooth.adapter?.name ?? "-"
          font.pixelSize: 12
          color: root.muted
      }

      // Separador
      Rectangle {
          Layout.fillWidth: true
          Layout.topMargin: 4
          Layout.bottomMargin: 4
          implicitHeight: 1
          color: Qt.rgba(1, 1, 1, 0.1)
      }

      Text {
          text: `DISPOSITIVOS (${Bluetooth.connectedDevices.length})`
          font { pixelSize: 11; bold: true; letterSpacing: 1.2 }
          color: root.muted
      }

      // Lista de dispositivos
      Repeater {
          model: Bluetooth.connectedDevices

          RowLayout {
              required property var modelData
              Layout.fillWidth: true
              spacing: 8

              Text {
                  text: root.iconFor(modelData)
                  font { family: root.iconFont; pixelSize: 15 }
                  color: root.accent
              }
              Text {
                  Layout.fillWidth: true
                  text: modelData.name
                  elide: Text.ElideRight
                  font.pixelSize: 13
                  color: "white"
              }
              Text {
                  visible: modelData.batteryAvailable
                  text: Math.round(modelData.battery * 100) + "%"
                  font.pixelSize: 12
                  color: root.muted
              }
          }
      }

      // Estado vacío
      Text {
          visible: Bluetooth.connectedDevices.length === 0
          text: "Ningún dispositivo conectado"
          font { pixelSize: 12; italic: true }
          color: root.muted
      }
    }
  }
}
