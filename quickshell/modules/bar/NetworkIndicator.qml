import QtQuick
import Quickshell
import qs.config
import qs.services

Text{
  id: root 
  readonly property var wifiIcons: [
      "signal_wifi_0_bar",
      "network_wifi_1_bar",
      "network_wifi_2_bar",
      "network_wifi_3_bar",
      "signal_wifi_4_bar"
  ]

  readonly property string icon: {
      if (Network.isEthernet) return "lan"
      if (Network.activeWifi) return wifiIcons[Math.round(Network.activeWifi.signalStrength * 4)]
      return "signal_wifi_off"
  }


  text: icon
  font.family: Theme.iconFont
  font.pixelSize: Theme.iconSize
  color: Theme.textOnSurface

  HoverHandler{
    id: hover
  }

  PopupWindow{
    id: popup

    visible: hover.hovered
    anchor.item: root
    anchor.edges: Edges.Bottom
    anchor.gravity: Edges.Bottom
    implicitWidth: label.implicitWidth + 16
    implicitHeight: label.implicitHeight + 16
    color: "transparent"

    Rectangle{
      anchors.topMargin: 8
      anchors.fill: parent
      radius: 6
      color: Theme.surface
  
      Text{
        id: label
        anchors.centerIn: parent
        text: Network.connectionName
        color: Theme.textOnSurface
      }
    }

  }
}
