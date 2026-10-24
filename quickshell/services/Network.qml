pragma Singleton
import Quickshell
import Quickshell.Networking

Singleton{
  id: root

  readonly property var devices: Networking.devices.values

  readonly property var activeDevice:
    devices.find(d => d.type === DeviceType.Wired && d.connected)
    ?? devices.find(d => d.type === DeviceType.Wifi && d.connected)
    ?? null

  readonly property bool isEthernet: activeDevice?.type === DeviceType.Wired
  readonly property var activeWifi:
    activeDevice?.type === DeviceType.Wifi
      ? activeDevice.networks.values.find(n => n.connected) ?? null
      : null

  readonly property string connectionName:
    isEthernet ? "Ethernet"
    : activeWifi ? activeWifi.name
    : "Desconectado"

  onConnectionNameChanged: console.log("[Network]", connectionName, activeDevice?.name ?? "")
  
}
