import Felgo 3.0
import QtQuick 2.0
import "pages"
App {
    id: main
    onInitTheme: {
        // estilos de pagina iniciales
        Theme.stackViewTransitionDuration = 320
        Theme.colors.tintColor =  "#546579"
        Theme.tabBar.backgroundColor= "#546579"
        Theme.tabBar.subTabTitleColor="white"
        Theme.tabBar.subTabTitleOffColor="lightgray"
        Theme.navigationAppDrawer.badgeFontSize = 12
        Theme.navigationAppDrawer.badgeTextColor = "white"
        Theme.navigationAppDrawer.badgeBackgroundColor = "grey"
        Theme.navigationAppDrawer.badgeRadius = 4
        Theme.navigationBar.backgroundColor = "#27364D"
        Theme.navigationTabBar.backgroundColor = "#27364D"
        Theme.colors.backgroundColor="#546579"

    }
    // view
    Navigation {
        id: navigation
        //con este modo de navegacion  ponemos los botones de las paginas creadas
        navigationMode: navigationModeTabs
        // pagina para codificar
        NavigationItem {
            title: "Codificador"
            icon: IconType.lock

            NavigationStack {
                initialPage: Codificador{}
            }
        }
        // pagina para descodificar
        NavigationItem {
            title: "Descodificador"
            icon: IconType.unlock

            NavigationStack {
                initialPage: Descodificador {
                }
            }
        }
        // pagina de codificaciones hechas

    }
}
