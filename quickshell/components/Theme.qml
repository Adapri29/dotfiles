pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick

Singleton{
  id: root

  property string name: "whisker"

  // Fondos
  readonly property color background:   json.surface                 // barra, fondo base
  readonly property color panel:        json.surface_container       // paneles, ventanas
  readonly property color card:         json.surface_container_high  // tarjetas, botones apagados

  // Acento
  readonly property color accent:       json.primary                 // lo activo/seleccionado
  readonly property color accentText:   json.on_primary              // texto sobre accent

  // Secundario
  readonly property color track:        json.secondary_container     // parte vacía de sliders, chips
  readonly property color trackText:    json.on_secondary_container  // texto sobre track

  // Texto
  readonly property color text:         json.on_surface              // texto principal
  readonly property color textDim:      json.on_surface_variant      // texto secundario, etiquetas

  // Otros
  readonly property color border:       json.outline                 // bordes, separadores
  readonly property color danger:       json.error                   // errores, peligro

  FileView{
    path: Quickshell.shellDir + "/themes/" + root.name + ".json"
    watchChanges: true
    onFileChanged: reload()
  
    JsonAdapter{
      id: json
  
      property color primary: "#ffb59c"
      property color on_primary: "#3f1d12"
      property color secondary_container: "#5a4038"
      property color on_secondary_container: "#ffdbcf"
      property color surface: "#1a1210"
      property color surface_container: "#2a1f1b"
      property color surface_container_high: "#3a2e29"
      property color on_surface: "#f1dfd8"
      property color on_surface_variant: "#d8c2ba"
      property color outline: "#a08d85"
      property color error: "#ffb4ab"
    }
  }

  IpcHandler{
    target: "theme"
    function set(theme: string): void {root.name = theme}
  }
}
