pragma Singleton
import Quickshell
import Quickshell.Hyprland

Singleton{
  readonly property int count: 6

  readonly property int focused: Hyprland.focusedWorkspace?.id ?? 1

  function isFocused(id){
    return focused === id
  }

  function isOccupied(id){
    return Hyprland.workspaces.values.some(w => w.id === id)
  }

  function goTo(id){
    Hyprland.dispatch(`hl.dsp.focus({workspace = "${id}" })`)
  }

  function previous(){
    goTo(focused < count ? focused + 1 : 1)
  }

  function next(){
    goTo(focused > 1 ? focused - 1 : count)
  }
}
