import Quickshell
import QtQuick

PopupWindow{
  id: root
  required property Item target
  property string text
  property bool shown: false

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
    implicitWidth: label.implicitWidth + 20
    implicitHeight: label.implicitHeight + 12
    radius: 10
    color: "#1A100F"

    Text{
      id: label
      anchors.centerIn: parent
      text: root.text
      color: "white"
      font.pixelSize: 13
    }
  }
}
