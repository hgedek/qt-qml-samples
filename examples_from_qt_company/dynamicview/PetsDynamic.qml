import QtQuick 2.0

Rectangle {
    id: root

    Component {
        id : dragDelegate

        Rectangle {
            id: content

            anchors { left: parent.left; right: parent.right }

            width: parent.width
            height: column.implicitHeight + 10

            border.width: 1
            border.color: "lightsteelblue"

            color: dragArea.held ? "lightsteelblue" : "white"
            Behavior on color {
                ColorAnimation {
                    duration: 200
                }
            }

            states: State {
                when: dragArea.held

                ParentChange { target: content; parent: root }
                AnchorChanges {
                    target: content
                    anchors {
                        horizontalCenter: undefined
                        verticalCenter: undefined
                    }
                }
            }

            Column {
                id: column
                anchors.fill: parent
                anchors.margins: 5

                Text { text: "Name: " + name }
                Text { text: "Age: " + age }
                Text { text: "Type: " + type }
                Text { text: "Size: " + size }
            }

            MouseArea {
                id: dragArea
                anchors.fill: parent

                property bool held: false

                onPressAndHold: held = true
                onReleased: held = false

                drag.target: content
                drag.axis: Drag.YAxis
            }
        }
    }

    ListView {
        id: view
        model: PetsModel {}
        delegate: dragDelegate
        anchors.fill: parent

        spacing: 4
        cacheBuffer: 40
    }
}
