import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column {
        anchors.fill: parent

        Item {
            id: container
            height: 100
            width: parent.width

            Rectangle {
                id: myrect
                width: 100
                height: 100
                color: "red"
            }

            states: State {
                name: "reanchored"
                AnchorChanges {
                    target: myrect
                    anchors.right: container.right
                }
            }

            transitions: Transition {
                to: "reanchored"
                AnchorAnimation { duration: 1000 }
            }

            Component.onCompleted: container.state = "reanchored"
        }

        Rectangle {
            color: "black"
            width: parent.width
            height: 100
            id: myrect2

            Rectangle {
               id: rect2
               width: 100
               height: 0
               color: "red"

               states: State {
                   name: "reanchored2"

                   AnchorChanges {
                       target: rect2
                       anchors.top: myrect2.top
                       anchors.bottom: myrect2.bottom
                       anchors.right: myrect2.right
                   }
               }

               transitions: Transition {
                   AnchorAnimation { duration: 1000;}
               }

               Component.onCompleted: rect2.state = "reanchored2"
            }
        }
    }
}
