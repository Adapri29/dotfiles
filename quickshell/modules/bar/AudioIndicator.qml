import QtQuick
import qs.config
import qs.services
import qs.components

CircularIndicator{
  id: root

  property int volume: Math.round(Audio.volume * 100)
  property string icon: {
    if(Audio.muted) return "volume_off";
    if(volume === 0) return "volume_mute";
    if(volume < 50) return "volume_down";
    return "volume_up";

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
    onTapped: Audio.toggleMute()
  }

  HoverHandler{
    cursorShape: Qt.PointingHandCursor
  }

  WheelHandler{
    acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
    onWheel:(event) => {
      const step = 0.05;
      if (event.angleDelta.y > 0) {
        Audio.setVolume(Audio.volume + step);
      }
      else if (event.angleDelta.y < 0){
        Audio.setVolume(Audio.volume - step);
      }
    }
  }
}
