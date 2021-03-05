import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Row {
        anchors.fill: parent

        populate: Transition {
            NumberAnimation {
                duration: 2000
                easing: Easing.OutBounce
            }
        }

        add: Transition {
            NumberAnimation {
                duration: 2000
                easing: Easing.OutBounce
            }
        }

        move: Transition {
            NumberAnimation {
                duration: 2000
                easing: Easing.InOutQuad
            }
        }

        Rectangle {
            color: "red"
            height: parent.height
            width:100

            Behavior on color { NumberAnimation {}}
        }

        Rectangle {
            color: "black"
            height: parent.height
            width: 50
        }

        Rectangle {
            color: "green"
            height: parent.height
            width: 100
        }
    }
}
