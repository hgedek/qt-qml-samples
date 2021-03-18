import QtQuick 2.12

Window {
    id: window
    width: 640
    height: 480
    visible: true

    color: "black"


    Item {
        id: container
        x: parent.width/2;
        y: parent.height/2

        Text {
            id: text
            anchors.centerIn: parent
            color: "white"
            text: "hello text"
            font.pixelSize: 32

            SequentialAnimation on font.letterSpacing {
                loops: -1
                NumberAnimation {
                    from: 0
                    to: 50
                    easing.type: Easing.InQuad
                    duration: 300
                }

                ScriptAction {
                    script: {
                        container.x = window.width/4 + Math.random() * window.height/2
                        container.y = window.height/4 + Math.random() * window.height/2
                    }
                }
            }

            SequentialAnimation on opacity {
                loops: -1
                NumberAnimation { from:1; to:0; duration: 2000 }
                PauseAnimation { duration:300 }
            }
        }
    }

}
