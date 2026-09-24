pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Bluetooth

Singleton{
  id: root

  readonly property var adapter: Bluetooth.defaultAdapter
  readonly property bool enabled: adapter?.enabled ?? false

  readonly property var connectedDevices: Bluetooth.devices.values.filter(d => d.connected)
  readonly property bool connected: connectedDevices.length > 0

  function toggle(){
    if(adapter)
      adapter.enabled = !adapter.enabled
  }

}


