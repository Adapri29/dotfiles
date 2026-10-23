import QtQuick
import qs.config
import qs.services
Row{
  id: root

  property int volume: Math.round(Audio.volume * 100)
  property string icon: {
    if(Audio.muted) return "volume_off";
    if(volume === 0) return "volume_mute";
    if(volume < 50) return "volume_down";
    return "volume_up";

  }

  spacing: Theme.spacing / 2 

  Text{
    text: root.icon
    font.family: Theme.iconFont
    font.pixelSize: Theme.iconSize
    color: Theme.textOnSurface
    anchors.verticalCenter: parent.verticalCenter
  }

  Text{
    text: root.volume + "%"
    font.family: Theme.font
    font.pixelSize: Theme.fontSize
    color: Theme.textOnSurface
    anchors.verticalCenter: parent.verticalCenter
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
