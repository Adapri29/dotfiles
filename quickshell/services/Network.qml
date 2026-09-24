pragma Singleton
import Quickshell
import Quickshell.Networking

Singleton{
  
  readonly property var wifi: Networking.devices.values.find(d => d.type === 1) ?? null 
  readonly property var wired: Networking.devices.values.find(d => d.type === 2) ?? null

  readonly property var active: wifi?.networks.values.find(n => n.connected) ?? null

  readonly property bool wifiEnabled: Networking.wifiEnabled
  readonly property bool ethernet: wired?.connected ?? false
  readonly property bool connected: ethernet || active !== null
  readonly property string ssid: active?.name ?? ""
  readonly property real strength: active?.signalStrength ?? 0

  function toggleWifi(){
    Networking.wifiEnabled = !Networking.wifiEnabled
  }
}
