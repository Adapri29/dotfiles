import QtQuick
import qs.services
import qs.components

Text{
  id: root
  property real volume: Audio.volume
  property bool muted: Audio.muted

  text: Audio.muted || Audio.volume === 0 ? "\u{f075f}" 
      : Audio.volume < 0.33 ? "\u{f057f}"
      : Audio.volume < 0.66 ? "\u{f0580}"
      : "\u{f057e}"
  font.family: "Symbols Nerd Font"
  font.pixelSize: 18
  color: "#FFFFFF"

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
