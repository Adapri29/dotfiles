import QtQuick
import QtQuick.Layouts
import qs.components
import qs.services

RowLayout{
   
  spacing: 5

  MaterialIcon{
    icon: "notifications" 
    color: Theme.text
    pixelSize: 20
  }

  Rectangle{
    visible: Notifications.count > 0
    Layout.alignment: Qt.AlignVCenter
    color: Theme.accent
    implicitWidth: Math.max(implicitHeight, notis_number.implicitWidth + 8)
    implicitHeight: notis_number.implicitHeight + 2
    radius: height/2

    Text{
      id: notis_number
      anchors.fill: parent
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: Notifications.count > 99 ? "99+" : Notifications.count
      color: Theme.accentText
    }
  }
}
