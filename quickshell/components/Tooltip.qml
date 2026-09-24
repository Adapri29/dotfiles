import Quickshell
import QtQuick

PopupWindow{
  id: root
  required property Item target
  property string text
  property bool shown: false
  property int padding: 12
  default property alias content: box.data

  anchor.item: target
  anchor.edges: Edges.Bottom
  anchor.gravity: Edges.Bottom

  visible: shown
  color: "transparent"
  implicitHeight: bg.implicitHeight + 25
  implicitWidth: bg.implicitWidth

  Rectangle{
    id: bg
    anchors.bottom: parent.bottom
    implicitWidth: box.implicitWidth + root.padding * 2
    implicitHeight: box.implicitHeight + root.padding * 2
    radius: 10
    color: Qt.alpha("#1A100F", 0.9)

    Column{  
      id: box
      anchors.centerIn: parent
      spacing: 4 

      Text{
        id: label
        text: root.text
        visible: root.text !== ""
        color: "white"
        font.family: "Symbols Nerd Font"
        font.pixelSize: 13
      }
    }
  }
}
