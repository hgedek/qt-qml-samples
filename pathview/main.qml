import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true

    Rectangle {
        anchors.fill: parent

        ListModel {
            id: listModel

            ListElement { name: "Music"; icon: "images/AudioPlayer_48.png" }
            ListElement { name: "Movies"; icon: "images/VideoPlayer_48.png" }
            ListElement { name: "Camera"; icon: "images/Camera_48.png" }
            ListElement { name: "DateBook"; icon: "images/Camera_48.png" }
            ListElement { name: "Email"; icon: "images/EMail_48.png" }
            ListElement { name: "ToDo"; icon: "images/TodoList_48.png" }
        }

        Component {
            id: delegateTemplate

            Item {
                width: 100; height: 100
                scale: PathView.iconScale
                // auto binding no type : component has property with same name
                // required color
                // non auto binding: a new property so
                // required property type name

                required property string name
                required property string icon
                required property int index

                Image {
                    id: icon
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 10
                    source: parent.icon
                }

                Text {
                    id: text
                    text: parent.name
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: icon.bottom
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: view.currentIndex = index
                }
            }
        }

        Component {
            id: hightlight
            Rectangle {
                width: 80; height: 80; color: "lightsteelblue"
            }
        }

        PathView {
            id: view
            anchors.fill: parent

            focus: true
            model: listModel
            delegate: delegateTemplate

            highlight: highlight
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5

            path: Path {
                startX: 10
                startY: 50
                PathAttribute { name: "iconScale"; value: 0.5 }
                PathQuad { x: 200; y: 150; controlX: 50; controlY: 200 }
                PathAttribute { name: "iconScale"; value: 1.0 }
                PathQuad { x: 590; y: 50; controlX: 450; controlY: 200 }
                PathAttribute { name: "iconScale"; value: 0.5 }
            }
        }
    }
}
