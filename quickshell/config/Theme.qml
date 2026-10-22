pragma Singleton
import Quichshell
import QtQuick

Singleton {
  // ─── Fondos (de más oscuro a más claro) ───────────────────
  readonly property color surface: "#101418"                  // fondo de la barra
  readonly property color surfaceContainer: "#1D2024"         // píldoras (grupo de estado, bandeja)
  readonly property color surfaceContainerHigh: "#272A2F"     // hover, popups, panel de ajustes rápidos
  readonly property color surfaceContainerHighest: "#32353A"  // botón pulsado, pista vacía de deslizadores

  // ─── Texto e iconos sobre fondos surface ──────────────────
  readonly property color onSurface: "#E1E2E8"                // texto e iconos principales
  readonly property color onSurfaceVariant: "#C3C7CF"         // secundario: workspaces vacíos, detalles

  // ─── Acento ───────────────────────────────────────────────
  readonly property color primary: "#A0CAFD"                  // workspace activo, relleno de deslizadores
  readonly property color onPrimary: "#003258"                // texto encima de primary
  readonly property color primaryContainer: "#184975"         // destacado suave: workspaces ocupados, toggles activos
  readonly property color onPrimaryContainer: "#D1E4FF"       // texto encima de primaryContainer

  // ─── Estados ──────────────────────────────────────────────
  readonly property color tertiary: "#D6BEE5"                 // aviso intermedio: batería < 30 %, cargando
  readonly property color error: "#FFB4AB"                    // batería baja, sin red
  readonly property color onError: "#690005"                  // texto encima de error

  // ─── Líneas y superposiciones ─────────────────────────────
  readonly property color outlineVariant: "#42474E"           // separadores, bordes de popups
  readonly property color scrim: "#000000"                    // oscurecer la pantalla tras el menú de apagar
                                                              // (úsalo con opacidad, p. ej. Qt.alpha(scrim, 0.5))

  // ─── Fuentes ──────────────────────────────────────────────
  readonly property string font: "Inter"
  readonly property string iconFont: "Material Symbols Rounded"
  readonly property int fontSize: 13
  readonly property int iconSize: 16

  // ─── Espaciado y forma (múltiplos de 4) ───────────────────
  readonly property int barHeight: 32
  readonly property int spacing: 8
  readonly property int padding: 8
  readonly property int radius: 12

  // ─── Animación ────────────────────────────────────────────
  readonly property int animFast: 150     // hover, pulsaciones
  readonly property int animNormal: 250   // abrir popups, cambiar de workspace
}
