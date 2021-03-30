import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true

    Flickable {
        id: view
        anchors.fill: parent
        contentWidth: picture.width
        contentHeight: picture.height

        Image {
            id: picture
            source: "pics/niagara_falls.jpg"
            asynchronous: true
        }

        states: State {
            name: "showbars"
            when: view.movingVertically || view.movingHorizontally

            PropertyChanges {
                target: verticalScrollbar
                opacity: 1
            }

            PropertyChanges {
                target: horizontalScrollbar
                opacity: 1
            }

            PropertyChanges {
                target: verticalScrollbar2
                opacity: 1
            }
        }

        transitions: Transition {
            NumberAnimation {
                properties: "opacity"
                duration: 400
            }
        }
    }

    Scrollbar {
        id: verticalScrollbar
        width: 12
        height: view.height - 12
        anchors.right: view.right
        opacity: 0
        orientation: Qt.Vertical
        position: view.visibleArea.yPosition
        pageSize: view.visibleArea.heightRatio
    }

    Scrollbar {
        id: horizontalScrollbar
        width: view.width - 12; height: 12
        anchors.bottom: view.bottom
        opacity: 0
        orientation: Qt.Horizontal
        position: view.visibleArea.xPosition
        pageSize: view.visibleArea.widthRatio
    }

    Scrollbar {
        id: verticalScrollbar2
        width: 20
        height: view.height-20
        anchors.left: view.left
        opacity: 0
        orientation: Qt.Vertical
        position: view.visibleArea.yPosition
        pageSize: view.visibleArea.heightRatio
    }
}
