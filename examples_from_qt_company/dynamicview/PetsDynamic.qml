import QtQuick 2.0
import QtQml.Models 2.1

Rectangle {
    id: root

    Component {
        id : dragDelegate

        MouseArea {
            id: dragArea

            property bool held: false

            anchors { left: parent.left; right: parent.right }
            height: content.height

            drag.target: held ? content : undefined
            drag.axis: Drag.YAxis

            onPressAndHold: held = true
            onReleased: held = false

            Rectangle {
                id: content
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }

                width: dragArea.width
                height: column.implicitHeight + 5

                border.width: 1
                border.color: "lightsteelblue"

                color: dragArea.held ? "lightsteelblue" : "white"
                Behavior on color { ColorAnimation { duration: 200 }}

                radius: 2

                Drag.active: dragArea.held
                Drag.source: dragArea
                Drag.hotSpot.x: width/2
                Drag.hotSpot.y: height/2

                states: State {
                    when: dragArea.held

                    ParentChange { target: content; parent: root }
                    AnchorChanges {
                        target: content
                        anchors { verticalCenter: undefined; horizontalCenter: undefined }
                    }
                }

                Column {
                    id: column
                    Text { text: "Name: " + name }
                    Text { text: "Type: " + type }
                    Text { text: "Size: " + size }
                    Text { text: "Age: " + age }
                }
            }

            DropArea {
                anchors { fill: parent; margins: 10 }
                onEntered: (drag) => {
                   console.log("from:" + drag.source.DelegateModel)
                   console.log("to:" + dragArea.DelegateModel)

                   visualModel.items.move(
                       drag.source.DelegateModel.itemsIndex,
                       dragArea.DelegateModel.itemsIndex
                   )

               }
            }
        }
    }

    DelegateModel {
        id: visualModel
        model: PetsModel {}
        delegate: dragDelegate
    }

    ListView {
        id: view
        anchors.fill: parent
        anchors.margins: 2

        model: visualModel
        spacing: 4
        cacheBuffer: 40
    }
}
