import QtQuick 2.12
import QtQuick.Window 2.12
import QtQml.Models

Window {
    width: 640
    height: 480
    visible: true

    Rectangle {
        id: root
        anchors.fill: parent
        color: "lightsteelblue"

        property bool printDestruction: false

        ObjectModel {
            id: itemModel

            Rectangle {
                width: view.width
                height: view.height
                color: "#FFFEF0"
                Text { text: "page 1"; font.bold: true; anchors.centerIn: parent }

                Component.onDestruction: {
                    if (root.printDestruction) print("destroyed 1");
                }
            }

            Rectangle {
                width: view.width; height: view.height
                color: "#F3FAFB"
                Text { text: "page 2"; font.bold: true; anchors.centerIn: parent }

                Component.onDestruction: if (root.printDestruction) print("destroyed 2");
            }

            Rectangle {
                width: view.width; height: view.height;
                color: "red"
                Text { text: "page 3"; font.bold: true; anchors.centerIn: parent }

                Component.onDestruction: if (root.printDestruction) print("destoryed 3");
            }
        }

        ListView {
            id: view
            model: itemModel
            anchors.fill: parent
            anchors.bottomMargin: 30

            preferredHighlightBegin: 0
            preferredHighlightEnd: 0

            highlightRangeMode: ListView.StrictlyEnforceRange
            orientation: ListView.Horizontal
            snapMode: ListView.SnapOneItem // ?
            flickDeceleration: 2000 // ?
            cacheBuffer: 200
        }

        Rectangle {
            width: root.width; height: 30
            anchors.top: view.bottom
            anchors.bottom: parent.bottom
            color: "gray"

            Row {
                anchors.centerIn: parent
                spacing: 20

                Repeater {
                    model: itemModel.count

                    Rectangle {
                        required property int index

                        width: 5; height: 5; radius: 3;
                        color: view.currentIndex == index ? "blue" : "white"

                        MouseArea {
                            width: 20; height: 20
                            anchors.centerIn: parent
                            onClicked: view.currentIndex = parent.index
                        }
                    }
                }
            }
        }
    }
}
