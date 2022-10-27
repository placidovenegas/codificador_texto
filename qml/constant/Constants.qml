pragma Singleton

import QtQuick 2.0
import VPlayApps 1.0

Item {

    // OneSignal
    readonly property string oneSignalAppId: "1c016d53-8daf-40c1-9f8a-f8b7807a0ec2"
    readonly property string oneSignalGoogleProjectNumber: "75727887198"

    // Colores
    readonly property string redTintColor: "#da291c" //"#e51c15"
    readonly property string redPalma: "#EA4133"
    readonly property string redBackground: "#F4CBC9"
    readonly property string textGray: "#686868"

    property string unreadBackgroundColor: '#d4eef8'

    // Colores en consola:
    readonly property string colorConsolaReset: "\x1b[0m" // se pone siempre al final
    readonly property string colorConsolaBright: "\x1b[1m" // sin probar
    readonly property string colorConsolaDim: "\x1b[2m" // sin probar
    readonly property string colorConsolaUnderscore: "\x1b[4m" // sin probar
    readonly property string colorConsolaBlink: "\x1b[5m" // sin probar
    readonly property string colorConsolaReverse: "\x1b[7m" // sin probar
    readonly property string colorConsolaHidden: "\x1b[8m" // sin probar

    readonly property string colorConsolaLetraNegro: "\x1b[30m" // color letra NEGRO
    readonly property string colorConsolaLetraRojo: "\x1b[31m" // color letra ROJO
    readonly property string colorConsolaLetraVerde: "\x1b[32m" // color letra VERDE
    readonly property string colorConsolaLetraAmarillo: "\x1b[33m" // color letra AMARILLO
    readonly property string colorConsolaLetraAzul: "\x1b[34m" // color letra AZUL
    readonly property string colorConsolaLetraMagenta: "\x1b[35m" // color letra MAGENTA
    readonly property string colorConsolaLetraCyan: "\x1b[36m" // color letra CYAN
    readonly property string colorConsolaLetraBlanco: "\x1b[37m" // color letra BLANCO

    readonly property string colorConsolaFondoNegro: "\x1b[40m" // color fondo NEGRO
    readonly property string colorConsolaFondoRojo: "\x1b[41m" // color fondo ROJO
    readonly property string colorConsolaFondoVerde: "\x1b[42m" // color fondo VERDE
    readonly property string colorConsolaFondoAmarillo: "\x1b[43m" // color fondo AMARILLO
    readonly property string colorConsolaFondoAzul: "\x1b[44m" // color fondo AZUL
    readonly property string colorConsolaFondoMagenta: "\x1b[45m" // color fondo MAGENTA
    readonly property string colorConsolaFondoCyan: "\x1b[46m" // color fondo CYAN
    readonly property string colorConsolaFondoBlanco: "\x1b[47m" // color fondo BLANCO
}
