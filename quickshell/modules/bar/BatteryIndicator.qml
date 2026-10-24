import QtQuick
import qs.services
import qs.config

Item {
    id: root
    visible: Battery.available
    implicitWidth: level.implicitWidth
    implicitHeight: level.implicitHeight

    readonly property var batteryIcons: [
        "battery_android_0",
        "battery_android_1",
        "battery_android_2",
        "battery_android_3",
        "battery_android_4",
        "battery_android_5",
        "battery_android_6",
        "battery_android_full"
    ]

    // Icono de nivel
    Text {
        id: level
        text: Battery.low ? "battery_android_alert"
                          : root.batteryIcons[Math.round(Battery.percentage * 7)]
        font.family: Theme.iconFont
        font.pixelSize: Theme.iconSize
        color: Theme.textOnSurface
    }

    // Rayo encima cuando hay cargador
    Text {
        visible: Battery.pluggedIn
        anchors.centerIn: level
        text: "bolt"
        font.family: Theme.iconFont
        font.pixelSize: Theme.iconSize * 0.6
        color: Theme.surface
    }
}
