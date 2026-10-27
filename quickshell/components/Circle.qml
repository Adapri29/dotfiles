import QtQuick
import qs.config

Rectangle{
  property int size: 16
  property color fill: Theme.primary
  property color borderColor: "transparent"
  property int borderWidth: 0


  width: size
  height: size
  radius: size / 2
  color: fill 
  border.color: borderColor
  border.width: borderWidth

}
