import Quickshell
import QtQuick
import qs.config

Text{
  SystemClock{
    id: clock
    precision: SystemClock.Seconds
  }

  text: Qt.locale().toString(clock.date, "hh:mm '•' dddd, dd MMM yyyy")
  color: Theme.textOnSurface
  font.family: Theme.font
  font.pixelSize: Theme.fontSize
  font.features: ({"tnum": 1})
}
