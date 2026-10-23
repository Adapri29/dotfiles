pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton{
  id: root

  readonly property PwNode sink: Pipewire.defaultAudioSink
  readonly property PwNode source: Pipewire.defaultAudioSource

  PwObjectTracker{
    objects: [root.sink, root.source]
  }

  property real volume: sink?.audio?.volume ?? 0
  property bool muted: sink?.audio?.muted ?? false

  function toggleMute(){
    if(sink?.audio){
      sink.audio.muted = !sink.audio.muted;
    }
  }

  function setVolume(value){
    if(sink?.audio){
      sink.audio.volume = Math.max(0, Math.min(1, value));
    }
  }
}
