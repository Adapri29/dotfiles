import QtQuick
import qs.config
import qs.services
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
    onTapped: Audio.toggleMicMute()
  }

  HoverHandler{
    cursorShape: Qt.PointingHandCursor
  }
}
