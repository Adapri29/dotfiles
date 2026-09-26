import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services
import qs.components

Scope{

  id: root
  property bool visible: false

  Connections{
    target: Audio
    function onVolumeChanged() {root.trigger()}
    function onMutedChanged() {root.trigger()}
  }

  function trigger(){
    visible = true
    timer.restart()
  }

  Timer{
    id: timer
    interval: 1200
    onTriggered: root.visible = false
  }

  LazyLoader{
    active: root.visible

    PanelWindow{
      anchors.top: true
      margins.top: 10
      implicitWidth: 320
      implicitHeight: 48
      color: "transparent"
      exclusiveZone: 0
      mask: Region{}

      Rectangle{
        anchors.fill: parent
        color: Qt.alpha("#1A100F", 0.9) 
        radius: 20

        RowLayout{
          spacing: 10
          anchors{
            fill: parent
            leftMargin: 15
            rightMargin: 15
          }

          MaterialIcon{
            text: Audio.muted ? "volume_off" : Audio.volume > 50 ? "volume_up" : "volume_down"
            size: 30
          }       

          Rectangle{
            Layout.fillWidth: true
            implicitHeight: 8
            radius: 4
            color: "#40ffffff"

            Rectangle{
              anchors.left: parent.left
              anchors.top: parent.top
              anchors.bottom: parent.bottom
              radius: parent.radius             
              color: "#F2A594"
              width: parent.width * Math.min(1, Audio.volume)
            }
          }
   
          Text{
            text:`${Math.round(Audio.volume * 100,2)}%`
            color:"white"
            font.pixelSize: 15
          }


        }
      }
    }
  }
}
