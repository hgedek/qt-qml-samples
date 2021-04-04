import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true

    Rectangle {
        anchors.fill: parent
        color: "lightblue"

        Text {
            id: hellocell
            text: "Hello Cells"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 40
            font.bold: true

            MouseArea {
                id: mouseArea
                anchors.fill: parent
            }

            states: State {
                when: mouseArea.pressed
                PropertyChanges {
                    target:hellocell
                    y: 160
                    rotation: 180
                    color: "red"
                }
            }

            transitions: Transition {
               reversible: true
               ParallelAnimation {
                   NumberAnimation {
                       properties: "y"; duration:500; easing.type: Easing.InOutQuad
                   }
                   RotationAnimation {
                       duration: 500
                       easing.type: Easing.InOutQuad
                   }
                   ColorAnimation {
                       duration: 500
                   }
               }
            }
        }

        Grid {
            id: colorPicker
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 4
            rows: 2; columns:3; spacing: 5

            Cell { color: "red"; onClicked: hellocell.color = value; }
            Cell { color: "blue"; onClicked: hellocell.color = value; }
            Cell { color: "green"; onClicked: hellocell.color = value; }
            Cell { color: "yellow"; onClicked: hellocell.color = value; }
            Cell { color: "black"; onClicked: hellocell.color = value; }
            Cell { color: "white"; onClicked: hellocell.color = value; }
            Cell { color: "#fdafd3"; onClicked: hellocell.color = value; }
            Cell { color: "#ddccdd"; onClicked: hellocell.color = value; }
        }
    }
}
