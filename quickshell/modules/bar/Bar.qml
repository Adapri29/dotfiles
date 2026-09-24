import Quickshell
import QtQuick
import QtQuick.Layouts

Scope{
	id: root
	
Variants {
		model: Quickshell.screens
	
		PanelWindow{
			required property var modelData
			screen: modelData

			anchors{
				top: true
				left: true
				right: true
      }

      implicitHeight: 60
      color: "#1A100F"

      //Center
      Rectangle{
        anchors.centerIn: parent
        width: center.implicitWidth + 20
        height: center.implicitHeight + 20
        radius: 25
        color: Qt.rgba(0.5, 0.5, 0.5, 0.2)

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
        color: Qt.rgba(0.5, 0.5, 0.5, 0.2)

        RowLayout{
          id: status
          anchors.centerIn: parent
          spacing: 15

          VolumeTray{}
          NetworkTray{}
          BluetoothTray{}
        }

      }
		}
	}
}
