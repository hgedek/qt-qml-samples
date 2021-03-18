import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: topRect
        color: "#333333"
        width: parent.width
        height: parent.height/2

        Column {
            anchors.centerIn: parent
            spacing: 2

            Repeater {
                model: ["#9ACD32", "#EEEEEE", "#FFD700", "#87CEEB"]

                delegate: Rectangle {
                    required property color modelData
                    property real scaleFactor: 1

                    height: 40 * scaleFactor
                    width: 40 * scaleFactor
                    color: modelData

                    anchors.horizontalCenter: parent.horizontalCenter

                    MouseArea {
                        anchors.fill: parent
                        onWheel: {
                            if (wheel.modifiers & Qt.ControlModifiers) {
                                parent.scaleFactor += 0.3 * wheel.angleDelta.y / 120;
                                if (parent.scaleFactor < 0)
                                    parent.scaleFactor = 0;
                            }
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: box
        width: parent.width
        height: parent.height/2
        anchors.top: topRect.bottom
        anchors.topMargin: 2

        Rectangle {
            id: redSquare
            width: 120
            height: 120
            anchors.top: parent.top; anchors.left: parent.left; anchors.margins: 10
            color: "red"
            opacity: redSquareMouseArea.containsPress ? 0.6 : 1.0

            Text { text: "Click"; font.pixelSize: 16; anchors.centerIn: parent }

            MouseArea {
                id: redSquareMouseArea
                anchors.fill: parent
                hoverEnabled: true

                property string buttonID

                acceptedButtons: Qt.AllButtons

                onEntered: info.text= "entered"
                onExited: info.text= "exited"

                onPressed:(mouse) => {
                    if (mouse.button == Qt.LeftButton)
                      buttonID = "LeftButton"
                    else if (mouse.button == Qt.RightButton)
                      buttonID = "RightButton"
                    else if (mouse.button == Qt.MiddleButton)
                      buttonID = "MiddleButton"


                  info.text = "Pressed " + buttonID + " shift = " + ( mouse.modifiers & Qt.ShiftModifiers  ? "true" : "false" )
                  var posIndex = redSquare.mapToItem(box, mouse.x, mouse.y)
                  console.log("mouse: " + mouse.x + "," + mouse.y + '\n' + "pos: " + posIndex.x + ',' + posIndex.y)
                }
            }
        }
        Text {
            id: info
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 20
        }

        Rectangle {
            id: blueSquare
            width: 120
            height: 120
            anchors.left: redSquare.right
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 10
            color: "blue"

            MouseArea {
                anchors.fill: parent
                drag.target: blueSquare
                drag.axis: Drag.XAndYAxis
            }
        }
    }
}
