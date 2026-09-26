import QtQuick
import qs.services
import qs.components

Row{
  spacing: 15

  Repeater{
    model: Workspaces.count
    
    Rectangle{
      id: dot
      required property int index

      readonly property bool focused: Workspaces.isFocused(index + 1)
      readonly property bool occupied: Workspaces.isOccupied(index + 1)

      width: focused ? 30 : 15
      height: 15
      radius: 20
      color: focused ? Theme.accent 
           : occupied ? (hover.hovered ? Theme.text : Theme.textDim)
           : (hover.hovered ? Theme.textDim : Theme.border)

      Behavior on width{NumberAnimation{duration: 200; easing.type: Easing.OutCubic}}

      Behavior on color{ColorAnimation {duration: 200}}

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
