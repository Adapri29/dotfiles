import Quickshell
import Quickshell.Wayland
import QtQuick
import qs.services


Variants{
  model: Quickshell.screens

  PanelWindow{
    required property var modelData
    screen: modelData

    WlrLayershell.layer: WlrLayer.Background //Se dibuja debajo del todo
    WlrLayershell.namespace: "wallpaper" //Para layer-rule de niri
    exclusionMode: ExclusionMode.Ignore // No reserva espacio
    anchors { top: true; bottom: true; left: true; right: true }
    color: "black"

    Item{
      id: root
      anchors.fill: parent
      
      property bool firstOnTop: true
      readonly property Image hiddenImage: firstOnTop ? second : first

      // Intercambia las imágenes
      function swapIfHidden(image){
        if(image.status == Image.Ready && image == hiddenImage){
          firstOnTop = !firstOnTop
        }
      }

      WallpaperImage{
        id: first 
        opacity: root.firstOnTop ? 1 : 0
        onStatusChanged: root.swapIfHidden(first)
      }

      WallpaperImage{
        id: second 
        opacity: root.firstOnTop ? 0 : 1
        onStatusChanged: root.swapIfHidden(second)
      }

      // Ruta inicial asignada una vez, sin binding
      Component.onCompleted: first.source = Wallpaper.path

      // Cada cambio de ruta se carga en la imagen oculta
      Connections{
        target: Wallpaper
        function onPathChanged(){
          root.hiddenImage.source = Wallpaper.path
        }
      }

      
    }
  }
}
