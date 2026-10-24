pragma Singleton
import Quickshell
import Quickshell.Services.UPower

Singleton{
  readonly property var device: UPower.displayDevice
  readonly property bool available: device.ready && device.isLaptopBattery

  readonly property real percentage: device.percentage
  readonly property bool pluggedIn: !UPower.onBattery
  readonly property bool low: !pluggedIn && percentage < 0.1
}
