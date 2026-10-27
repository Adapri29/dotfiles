import QtQuick
import qs.config
import qs.services
import Quickshell
import qs.components

CircularIndicator{
  id: root
  
  property real volume: Math.round(Audio.micVolume * 100)
  property string icon: {
    if(Audio.micMuted) return "mic_off"
    return "mic";
  }

  progress: volume / 100

  Text{
    text: root.icon
    font.family: Theme.iconFont
    font.pixelSize: Theme.iconSize
    color: Theme.textOnSurface
    anchors.centerIn: parent
  }

  TapHandler{
    acceptedButtons: Qt.LeftButton
    onTapped: Audio.toggleMicMute()
  }

  TapHandler{
    acceptedButtons: Qt.RightButton
    onTapped: Quickshell.execDetached(["sh", "-c", "pkill -x pwvucontrol || pwvucontrol"])
  }

  HoverHandler{
    cursorShape: Qt.PointingHandCursor
  }
}
