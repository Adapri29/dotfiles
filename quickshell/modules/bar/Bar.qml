import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

Variants{
  model: Quickshell.screens

  PanelWindow{
    required property var modelData
    screen: modelData

    anchors {top: true; left: true; right: true}
    implicitHeight: Theme.barHeight
    color: Theme.surface

    // --- Izquierda ---
    RowLayout{
      anchors{
        left: parent.left
        leftMargin: Theme.padding
        verticalCenter: parent.verticalCenter
      }

      spacing: Theme.spacing
    }

    // --- Centro ---
    Clock{
      anchors.centerIn: parent
    }

    // --- Derecha ---
    RowLayout{
      anchors{
        right: parent.right
        rightMargin: Theme.padding
        verticalCenter: parent.verticalCenter
      }

      spacing: Theme.spacing

      MicrophoneIndicator{}
      AudioIndicator{}
      NetworkIndicator{}
      BatteryIndicator{}
    }
  }
}
