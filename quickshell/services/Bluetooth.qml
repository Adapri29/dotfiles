pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Bluetooth

Singleton{
  id: root

  readonly property var adapter: Bluetooth.defaultAdapter
  readonly property bool enabled: adapter?.enabled ?? false

  
  function toggleState(){
    adapter.enabled = !adapter.enabled
  }
}
