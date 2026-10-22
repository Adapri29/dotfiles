pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick

Singleton{
  id: root
  property string path: Quickshell.env("HOME") + "/Pictures/Wallpapers/ciudad_lagrimas.jpg"

  // Comando cambiar wallpaper desde terminal
  // qs ipc call wallpaper set  
  IpcHandler{
    target: "wallpaper"
    function set(newPath: string): void {
      root.path = newPath
    }
  }
}
