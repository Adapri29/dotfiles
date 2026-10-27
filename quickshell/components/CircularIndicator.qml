import QtQuick
import QtQuick.Shapes
import qs.config


Item{
  id: root

  property real size: 32
  property real lineWidth: 3
  property color color: Theme.primary
  property real progress: 0.75
  property real startAngle: -90

  implicitWidth: size
  implicitHeight: size

  Shape{
    anchors.fill: parent
    preferredRendererType: Shape.CurveRenderer

    ShapePath{
      strokeColor: root.color
      strokeWidth: root.lineWidth
      fillColor: "transparent"
      capStyle: ShapePath.RoundCap

      PathAngleArc{
        centerX: root.width / 2
        centerY: root.height / 2
        radiusX: (root.width - root.lineWidth) / 2
        radiusY: (root.height - root.lineWidth) / 2
        startAngle: root.startAngle
        sweepAngle: 360 * root.progress
        moveToStart: true
      }
    }
  }
}
