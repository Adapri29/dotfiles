import QtQuick
import Quickshell
import qs.config
import qs.components
import qs.services

Circle{
  size: 32
  anchors.verticalCenter: parent.verticalCenter

  Text{
    id: root

    anchors.centerIn: parent

    readonly property string icon:{
      if(Bluetooth.enabled) return "bluetooth"
      return "bluetooth_disabled"
    }
    text: icon
    font.family: Theme.iconFont
    font.pixelSize: Theme.iconSize
    color: Theme.textOnSurface
  }

  TapHandler{
    acceptedButtons: Qt.LeftButton
    onTapped: Bluetooth.toggleState() 
  }

  TapHandler{
    acceptedButtons: Qt.RightButton
    onTapped: Quickshell.execDetached(["sh", "-c", "pkill -x blueman-manager || blueman-manager"])
  }

  HoverHandler{
    cursorShape: Qt.PointingHandCursor
  }
}
