import QtQuick 2.0
import Felgo 3.0

Page {
    navigationBarHidden: true
    property string palabraSecreta: ''
    property string textCodicar: ''
    property string textCodificado: ''
    property bool textoCodificado: false
    property bool visibleError: false
    property string textError: ''
    property bool textoDescodificado: false
    Item{
        anchors.fill: parent
        AppText{
            id:textCod
            text:'DESCODIFICAR'
            font.bold: true
            color:'white'
            anchors.top: parent.top
            anchors.topMargin: dp(15)
            anchors.horizontalCenter: parent.horizontalCenter
            fontSize: 22
        }
        Item{
            anchors.top:textCod.bottom
            anchors.bottom: formulario.top
            width: parent.width
            Rectangle{
                id:rectNot
                visible: visibleError
                anchors.centerIn: parent
                width: parent.width*0.82
                color: "#CB6868"
                radius: dp(4)
                height: dp(45)

                AppText{
                    id:textErrorNot
                    text: textError
                    anchors.left: parent.left
                    anchors.leftMargin: dp(10)
                    width: parent.width*0.85
                    anchors.verticalCenter:parent.verticalCenter
                    fontSize: 12

                }

                IconButton{
                    anchors.verticalCenter:parent.verticalCenter
                    anchors.right: parent.right
                    icon:IconType.close
                    color: 'white'
                    onClicked: {
                        timerError.stop()
                        visibleError=false
                        rectNot.color="#CB6868"
                    }
                }
            }
        }
        Timer {
            id:timerError
            interval: 4000; running: false; repeat: false
            onTriggered:visibleError=false
        }
        Item{
            id:formulario
            width: parent.width*0.9
            height: parent.height*0.60
            anchors.centerIn: parent
            AppText{
                text:'PALABRA SECRETA'
                font.bold: true
                color:'white'
                anchors.bottom: textInputSecret.top
                anchors.bottomMargin: dp(5)
                anchors.left: textInputSecret.left
                fontSize: 14
            }
            AppTextField{
                id: textInputSecret
                anchors.top: parent.top
                anchors.topMargin: dp(20)
                width: parent.width*0.9
                placeholderText: 'Coloque una palabra clave'
                height:dp(30)
                radius: dp(4)
                borderColor:"#27364D"
                borderWidth : dp(2)
                anchors.horizontalCenter: parent.horizontalCenter
                backgroundColor: 'white'
                cursorColor:"#27364D"
                showClearButton:true
                showPasswordVisibleButton:true
                font.pixelSize: sp(15)
                leftPadding: dp(10)
                validator: RegExpValidator {
                    regExp: /[A-Za-z]+/
                }
                onTextChanged: palabraSecreta=textInputSecret.text
            }

            AppText{
                text:'TEXTO'
                font.bold: true
                color:'white'
                anchors.bottom: rectText.top
                anchors.left: rectText.left
                fontSize: 14
                anchors.bottomMargin: dp(5)
            }

            Rectangle {
                id:rectText
                color: "#fff"
                anchors.top: textInputSecret.bottom
                anchors.topMargin: dp(40)
                width: parent.width*0.9
                height:parent.height*0.5
                anchors.horizontalCenter: parent.horizontalCenter
                radius:dp(4)
                border.color:"#27364D"
                border.width : dp(2)


                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        appTextEdit.forceActiveFocus()
                    }
                }
                Column{
                    z:9999
                    height: parent.height*0.5
                    width: dp(50)
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    IconButton{
                        color:'black'
                        icon: IconType.paste
                        onClicked:{
                            textoDescodificado=false
                            appTextEdit.selectAll()
                            appTextEdit.paste()
                        }
                    }
                    IconButton{
                        enabled: appTextEdit.text.length>0
                        color:'black'
                        icon: IconType.copy
                        onClicked:{
                            appTextEdit.selectAll()
                            appTextEdit.copy()
                        }
                    }
                }
                AppFlickable {
                    id: flick
                    anchors.fill: parent
                    contentWidth: width
                    contentHeight: appTextEdit.height

                    AppTextEdit {
                        id: appTextEdit
                        width: parent.width*0.95
                        anchors.top: parent.top
                        anchors.topMargin: dp(10)
                        anchors.left: parent.left
                        anchors.leftMargin: dp(10)
                        height: Math.max(appTextEdit.contentHeight, flick.height)
                        verticalAlignment: TextEdit.AlignTop
                        inputMethodHints: Qt.ImhSensitiveData
                        cursorInView: true
                        cursorInViewBottomPadding: dp(25)
                        cursorInViewTopPadding: dp(25)
                        flickable: flick
                        fontSize: 16
                        placeholderText: 'Ecriba el texto a codificar'
                        text: ""
                        wrapMode: "WrapAtWordBoundaryOrAnywhere"
                        onTextChanged: {
                            textCodicar=appTextEdit.text
                        }
                    }
                }
                ScrollIndicator {
                    flickable: flick
                }
            }
            Rectangle{
                anchors.top: rectText.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: dp(30)
                width: parent.width*0.9
                radius: dp(4)
                height: dp(40)
                color:appTextEdit.text.length>0 &&textoDescodificado? "white": 'gray'
                AppText{
                    font.bold: true
                    anchors.centerIn: parent
                    text:'DESCODIFICAR'
                }
                RippleMouseArea{
                    anchors.fill: parent

                    circularBackground: false

                    onClicked: {
                        if(appTextEdit.text.length>0 && textInputSecret.text.length>0 && textInputSecret.text.length<=10 ){

                            if(!textoCodificado  ){
                                descodificar(appTextEdit.text)
                            }
                        }else{
                            console.log('ERROR')
                            if(appTextEdit.text.length<=0 ){
                                console.log('ERROR SIN MENSAJE')
                                timerError.start()
                                visibleError= true
                                textError= '<b>ERROR:</b> '+'Algun campo no es correcto'
                            }else if(textInputSecret.text.length<=0 ){
                                console.log('ERROR SECRETA')
                                timerError.start()
                                visibleError= true
                                textError= '<b>ERROR:</b> '+'Algun campo no es correcto'
                            }
                        }
                    }
                }


            }
        }
    }
    function descodificar(){
        if(!textoDescodificado){
            console.log('revertir')
            var decodeString = Qt.atob(appTextEdit.text)
            console.log(decodeString)
            console.log(decodeString.split('***//***'))
            var decodeText=decodeString.split('***//***')
            if(palabraSecreta===decodeText[0]){
                appTextEdit.text=decodeText[1]
                console.log(decodeString);
                textoCodificado=false
                textoDescodificado=true
            }else{
                timerError.start()
                visibleError= true
                textError= 'Algun campo no es correcto'
            }
        }else{
            timerError.start()
            visibleError= true
            rectNot.color="#68CB96"
            textError= 'Texto ya descodificado'
        }
    }


}
