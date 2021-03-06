import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Timer {
        interval: 1500
        repeat: true
        running: true
        onTriggered:  {
            console.log("Triggered")
            grid.flow = grid.flow == Grid.TopToBottom ? Grid.LeftToRight : Grid.TopToBottom
        }
    }

    Grid {
        id: grid
        anchors.fill: parent
        columns: 3
        spacing: 5

        populate: Transition {
            NumberAnimation {
                properties: "x,y"
                duration: 100
                easing: Easing.OutBounce
            }
        }

        add: populate
        move: add

        Rectangle { color: "black"; width: 50; height: 50 }
        Rectangle {
            width: 50
            height: 50
            color: "red"
            border.color: "Transparent"
        }

        Rectangle { color: "black"; width: 50; height: 50 }
        Rectangle {
            width: 50
            height: 50
            color: "red"
            border.color: "Transparent"
        }
        Rectangle { color: "black"; width: 50; height: 50 }
        Rectangle {
            width: 50
            height: 50
            color: "red"
            border.color: "Transparent"
        }
        Rectangle { color: "black"; width: 50; height: 50 }
        Rectangle {
            width: 50
            height: 50
            color: "red"
            border.color: "Transparent"
        }
        Rectangle { color: "black"; width: 50; height: 50 }
        Rectangle {
            width: 50
            height: 50
            color: "red"
            border.color: "Transparent"
        }
        Rectangle { color: "black"; width: 50; height: 50 }
        Rectangle {
            width: 50
            height: 50
            color: "red"
            border.color: "Transparent"
        }
    }
}
