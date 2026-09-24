import QtQuick
import qs.services

Row{
  spacing: 15

  Repeater{
    model: Workspaces.count
    
    Rectangle{
      id: dot
      required property int index

      width: Workspaces.isFocused(index+1) ? 30 : 15
      height: 15
      radius: 20
      opacity: Workspaces.isOccupied(index + 1) || hover.hovered ? 1.0 : 0.4
      color: Workspaces.isOccupied(index+1) || hover.hovered ? "#F2A594" : Qt.rgba(0.5, 0.5, 0.5, 1)

      Behavior on width{
        NumberAnimation{duration: 200; easing.type: Easing.OutCubic}
      }

      Behavior on color{
        ColorAnimation {duration: 200}
      }

      Behavior on opacity{ NumberAnimation {duration: 200 }}

          HoverHandler{
            id: hover
            cursorShape: Qt.PointingHandCursor
            margin: 5
          } 

          TapHandler{
            margin: 5
            onTapped: Workspaces.goTo(dot.index + 1)
          } 
      }
    }

    
  WheelHandler{
    acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
    onWheel: event => {
      console.log("wheel:", event.angleDelta.y)
      if(event.angleDelta.y > 0)
        Workspaces.previous()
      else if(event.angleDelta.y < 0)
        Workspaces.next()
    }
  }
}
