import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true


    Rectangle {
        anchors.fill: parent
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("mousearea 1")
            }

            Rectangle {
                anchors.fill: parent
                anchors.margins: 50
                color: "lightsteelblue"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("mouseare 3")
                    }
                }
            }
        }

        Rectangle {
            anchors.margins: 100
            anchors.fill: parent
            color: "red"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("mousearea 2")
                }
            }
        }
    }
}
