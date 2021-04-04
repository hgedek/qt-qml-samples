import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true

    ListModel {
        id: listModel

        ListElement {
            name: "Polly"
            type: "Parrot"
            age: 12
            size: "Small"
        }
        ListElement {
            name: "Penny"
            type: "Turtle"
            age: 4
            size: "Small"
        }
        ListElement {
            name: "Warren"
            type: "Rabbit"
            age: 2
            size: "Small"
        }
        ListElement {
            name: "Spot"
            type: "Dog"
            age: 9
            size: "Medium"
        }
        ListElement {
            name: "Schrödinger"
            type: "Cat"
            age: 2
            size: "Medium"
        }
        ListElement {
            name: "Joey"
            type: "Kangaroo"
            age: 1
            size: "Medium"
        }
        ListElement {
            name: "Kimba"
            type: "Bunny"
            age: 65
            size: "Large"
        }
        ListElement {
            name: "Rover"
            type: "Dog"
            age: 5
            size: "Large"
        }
        ListElement {
            name: "Tiny"
            type: "Elephant"
            age: 15
            size: "Large"
        }
    }

    Rectangle {
        id: root

        anchors.fill: parent

        property bool expanded: false

        radius: 2
        border.width: 1
        border.color: "black"

        ListView {
            id: view
            anchors.fill: parent
            model: listModel

            delegate: Rectangle {
                Column {
                    id: column
                    Text { text: model.name }
                    Text { text: model.type }
                    Text { text: model.age }
                    Text { text: model.size }
                }

                width: view.width
                height: column.implicitHeight + 5

                border.width:  1
                border.color: "black"

                MouseArea {
                    anchors.fill: parent
                    onClicked: view.currentIndex = index
                }
            }

            highlight: Rectangle {
                height: 100
                width: 100
                color: "black"
                radius: 2
            }
        }
    }
}
