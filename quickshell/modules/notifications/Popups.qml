import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services
import qs.components

PanelWindow{
  anchors{ top: true; right: true}
  margins {top: 10; right: 10}
  exclusiveZone: 0
  color: "transparent"

  implicitWidth: 400
  implicitHeight: col.implicitHeight
  visible: Notifications.popups.length > 0

  ColumnLayout{
    id: col
    width: parent.width
    spacing: 8

    Repeater{
      model: Notifications.popups

      Rectangle{
        id: noti
        required property var modelData
        readonly property string iconSource:{
          if(modelData.image !== "")
            return modelData.image

          if(modelData.appIcon !== "")
            return modelData.appIcon.startsWith("/")
              ? "file://" + modelData.appIcon
              : Quickshell.iconPath(modelData.appIcon, true)
            
          const entry = DesktopEntries.byId(modelData.desktopEntry)
          if(entry && entry.icon != "")
            return Quickshell.iconPath(entry.icon, true)
          return ""
        }

        Layout.fillWidth: true
        implicitHeight: panel.implicitHeight  +  20
        radius: 15
        color: Theme.background

        Timer{
          running: true
          interval: noti.modelData.expireTimeout > 0 ? noti.modelData.expireTimeout : 5000
          onTriggered: Notifications.removePopup(noti.modelData)
        }
        
        Rectangle{
          id: panel
          anchors { left: parent.left; right: parent.right; top: parent.top; margins: 10 }
          implicitHeight: content.implicitHeight + 20
          color: Theme.card
          radius: 15

          RowLayout{
            id: content
            anchors{left: parent.left; right: parent.right; top: parent.top; margins: 10}
            spacing: 10

            Image{
              source: noti.iconSource
              visible: noti.iconSource !== ""
              fillMode: noti.modelData.image !== "" ? Image.PreserveAspectCrop : Image.PreserveAspectFit
              Layout.preferredWidth: 64
              Layout.preferredHeight: 64
              Layout.alignment: Qt.AlignCenter
            }

            ColumnLayout{
              Layout.fillWidth:true
              spacing: 2

              RowLayout{
                Layout.fillWidth: true
                Layout.bottomMargin: 6
                Text{
                  text: modelData.appName
                  color: Theme.text
                  font.bold: true
                  font.pixelSize: 15
                }

                Item{Layout.fillWidth: true}

                Text{
                  text: Notifications.timeAgo(noti.modelData)
                  color: Theme.text
                  font.pixelSize: 12
                }
              }

              Text{
                text:modelData.summary
                color: Theme.text
                font.pixelSize: 12
                elide: Text.ElideRight
              }
              
              Text{
                text: modelData.body
                color: Theme.text
                font.pixelSize: 12
                Layout.fillWidth: true
                wrapMode: Text.Wrap
                textFormat: Text.StyledText
              }
            } 
          }
        }
      }
    }
  }
}
