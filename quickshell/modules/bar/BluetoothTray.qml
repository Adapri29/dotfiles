import QtQuick
import qs.services
import qs.components
import QtQuick.Layouts

MaterialIcon{
  id: root

  function iconFor(device) {
      switch (device.icon) {
      case "input-gaming":     return "sports_esports"
      case "phone":            return "smartphone"
      case "audio-headset":    return "headset_mic"
      case "audio-headphones": return "headphones"
      case "input-mouse":      return "mouse"
      case "input-keyboard":   return "keyboard"
      default:                 return "bluetooth"
      }
  }


  icon: !Bluetooth.enabled ? "bluetooth_disabled"
      : Bluetooth.connectedDevices.length > 0 ? "bluetooth_connected"
      : "bluetooth"
  pixelSize: 21
  color: Bluetooth.enabled ? Theme.text : Theme.textDim

  Behavior on color {ColorAnimation  {duration: 200}}

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
          spacing: 5

          MaterialIcon {
            icon: !Bluetooth.enabled ? "bluetooth_disabled"
                : Bluetooth.connectedDevices.length > 0 ? "bluetooth_connected"
                : "bluetooth"
            color: Bluetooth.enabled ? Theme.accent : Theme.textDim
            pixelSize: 17
          }

          Text {
              text: "Bluetooth"
              font { pixelSize: 15; bold: true }
              color: Theme.accent
          }

          Item { Layout.fillWidth: true }
          
          Text {
              text: Bluetooth.enabled ? "Encendido" : "Apagado"
              font.pixelSize: 12
              color: Bluetooth.enabled ? Theme.accent : Theme.textDim
          }
      }

      Text {
          text: Bluetooth.adapter?.name ?? "-"
          font.pixelSize: 12
          color: Theme.text
      }

      // Separador
      Rectangle {
          Layout.fillWidth: true
          Layout.topMargin: 4
          Layout.bottomMargin: 4
          implicitHeight: 1
          color: Theme.border
      }

      Text {
          text: `Dispositivos (${Bluetooth.connectedDevices.length})`
          font { pixelSize: 13; bold: true; letterSpacing: 1.2 }
          color: Theme.accent
      }

      // Lista de dispositivos
      Repeater {
          model: Bluetooth.connectedDevices

          RowLayout {
              required property var modelData
              Layout.fillWidth: true
              spacing: 8

              MaterialIcon {
                  icon: root.iconFor(modelData)
                  pixelSize: 15
                  color: Theme.accent
              }

              Text {
                  Layout.fillWidth: true
                  text: modelData.name
                  elide: Text.ElideRight
                  font.pixelSize: 13
                  color: Theme.text
              }
              Text {
                  visible: modelData.batteryAvailable
                  text: Math.round(modelData.battery * 100) + "%"
                  font.pixelSize: 12
                  color: Theme.textDim
              }
          }
      }

      // Estado vacío
      Text {
          visible: Bluetooth.connectedDevices.length === 0
          text: "Ningún dispositivo conectado"
          font { pixelSize: 12; italic: true }
          color: Theme.textDim
      }
    }
  }
}
