import QtQuick
import qs.services
import qs.components

MaterialIcon{
  id: root
  property real volume: Audio.volume
  property bool muted: Audio.muted

  icon: Audio.muted || Audio.volume === 0 ? "volume_muted" 
      : Audio.volume < 0.5 ? "volume_down"
      : "volume_up"

  pixelSize: 20
  color: Theme.text

  Behavior on color {ColorAnimation {duration: 200}}

  HoverHandler{
    id: hover
    margin: 5
  }

  TapHandler {
    margin: 5
    onTapped: Audio.toggleMute()
  }

  Tooltip{
    target: root
    text: Audio.device
    shown: hover.hovered
  }
}
