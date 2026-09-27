pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton{
  id: root

  property bool dnd: false
  readonly property list<Notification> list: server.trackedNotifications.values
  readonly property int count: list.length
  property list<Notification> popups: []
  property var times: ({})
  property date now: new Date()

  Timer{
    running: true
    repeat: true
    interval: 60000
    onTriggered: root.now = new Date()
  }

  NotificationServer{
    id: server
    keepOnReload: true
    actionsSupported: true
    bodySupported: true
    bodyMarkupSupported: true
    imageSupported: true

    onNotification: n => {
      console.log("app:", n.appName, "| appIcon:", n.appIcon, "| image:", n.image, "| desktopEntry:", n.desktopEntry)
      root.times = Object.assign({}, root.times, {[n.id]: Date.now()})
      n.tracked = true
      if(!root.dnd)
        root.popups = [...root.popups, n]
      n.closed.connect(() => root.removePopup(n))
    }
  }

  function removePopup(n){
    root.popups = root.popups.filter(p => p !== n)
  }

  function clearAll(){
    for(const n of [...root.list]) n.dismiss()
  }

  function timeAgo(n){
    const t = root.times[n.id]
    if(!t) return ""

    const min = Math.floor((root.now - t) / 60000)
    if(min < 1) return "ahora"
    if(min < 60) return `hace ${min} min`

    const h = Math.floor(min / 60)
    if(h < 24) return `hace ${h} h`
    return Qt.formatDateTime(new Date(t), "dd/MM HH:mm")
  }
}
