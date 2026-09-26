import QtQuick
import qs.components

Text{
  property string icon
  property real fill: 0
  property int pixelSize: 24
  
  text: icon
  color: Theme.text
  font.family: "Material Symbols Rounded"
  font.pixelSize: pixelSize
  font.variableAxes: {"FILL": fill}
}
