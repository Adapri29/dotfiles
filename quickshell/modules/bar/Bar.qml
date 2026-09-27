import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.components
import Quickshell.Wayland

Scope{
	id: root
	
Variants {
		model: Quickshell.screens
	
		PanelWindow{
			required property var modelData
      screen: modelData

      WlrLayershell.namespace: "quickshell-bar"

			anchors{
				top: true
				left: true
				right: true
      }

      implicitHeight: 60
      color: Qt.alpha(Theme.background, 0.9)

      //Center
      Rectangle{
        anchors.centerIn: parent
        width: center.implicitWidth + 20
        height: center.implicitHeight + 20
        radius: 25
        color: Theme.card

        RowLayout{
          id: center
          anchors.centerIn: parent
          spacing: 15

          WorkspacesTray{}
        }
        
      }
      
      //Right
      Rectangle{
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        
        radius: 25
        width: status.implicitWidth + 20
        height: status.implicitHeight + 20
        color: Theme.card

        RowLayout{
          id: status
          anchors.centerIn: parent
          spacing: 15

          NotificationsTray{}
          VolumeTray{}
          NetworkTray{}
          BluetoothTray{}
        }

      }
		}
	}
}
