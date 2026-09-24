import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.widgets

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

      Workspaces{
        anchors.centerIn: parent
      }

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

          Volume{}
        }

      }
		}
	}
}
