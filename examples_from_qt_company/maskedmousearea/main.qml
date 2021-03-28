import QtQuick 2.12
import QtQuick.Window 2.12
import Example 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        anchors.fill: parent
        color: "black"

        Text {
            text: qsTr("CLICK AND HOVER")
            opacity: 0.6
            color: "white"
            font.pixelSize: 20
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 50
        }

        Image {
            id: moon
            anchors.centerIn: parent
            scale: moonArea.pressed ? 1.1 : 1.0
            opacity: moonArea.containsMouse ? 1.0 : 0.7
            source: Qt.resolvedUrl("images/moon.png")

            MaskedMouse {
                id: moonArea
                anchors.fill: parent
                alphaThreshold: 0.4
                maskSource: moon.source
            }

            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }
            Behavior on scale {
                NumberAnimation { duration: 100 }
            }
        }

        Image {
            id: rightCloud
            anchors {
                centerIn: moon
                verticalCenterOffset: 30
                horizontalCenterOffset: 80
            }
            scale: rightCloudArea.pressed ? 1.1 : 1.0
            opacity: rightCloudArea.containsMouse ? 1.0 : 0.7
            source: Qt.resolvedUrl("images/cloud_2.png")

            MaskedMouse {
                id: rightCloudArea
                anchors.fill: parent
                alphaThreshold: 0.4
                maskSource: rightCloud.source
            }

            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }
            Behavior on scale {
                NumberAnimation { duration: 100 }
            }
        }

        Image {
            id: leftCloud
            anchors {
                centerIn: moon
                verticalCenterOffset: 40
                horizontalCenterOffset: -80
            }
            scale: leftCloudArea.pressed ? 1.1 : 1.0
            opacity: leftCloudArea.containsMouse ? 1.0 : 0.7
            source: Qt.resolvedUrl("images/cloud_1.png")

            MaskedMouse {
                id: leftCloudArea
                anchors.fill: parent
                alphaThreshold: 0.4
                maskSource: leftCloud.source
            }

            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }
            Behavior on scale {
                NumberAnimation { duration: 100 }
            }
        }
    }
}
