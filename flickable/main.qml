import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Flickable {
        width: 300
        height: 300
        contentWidth: image.width
        contentHeight: image.height
        id: flickable

        Image {
            source: "images/face-smile.png"
            id: image
        }

        rebound: Transition {
            NumberAnimation {
                properties: "x,y"
                duration: 1000
                easing.type: Easing.OutBounce
            }
        }
    }
}
