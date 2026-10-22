import QtQuick

Image{
    id: self
    anchors.fill: parent
    fillMode: Image.PreserveAspectCrop
    asynchronous: true
    sourceSize.width: width
    Behavior on opacity {
      NumberAnimation{
        duration: 600;
        easing.type: Easing.InOutQuad
      }
    }
}
