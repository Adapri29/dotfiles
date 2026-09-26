import QtQuick

Text{
  property string icon
  property real fill: 0
  property int size: 24

  text: icon
  color: "white"
  font.family: "Material Symbols Rounded"
  font.pixelSize: size
  font.variableAxes: {"FILL": fill}
}
