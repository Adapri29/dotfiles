pragma Singleton
import Quickshell
import Quickshell.Services.Pipewire

Singleton{
  id: root

  readonly property PwNode sink: Pipewire.defaultAudioSink
  readonly property real volume: sink?.audio?.volume ?? 0
  readonly property bool muted: sink?.audio?.muted?? false
  readonly property real step: 0.05

  readonly property string device: sink?.description ?? ""

  function setVolume(v){
    if(sink?.audio)
      sink.audio.volume = Math.max(0, Math.min(1, v))
  }

  function increase() {setVolume(volume + step)}
  function decrease() {setVolume(volume - step)}

  function toggleMute(){
    if(sink?.audio)
      sink.audio.muted = !sink.audio.muted
  }

  PwObjectTracker{
    objects: [root.sink]
  }

}
