import QtQuick

Rectangle {
    id: icon

    required property Item dragParent

    property int visualIndex: 0

    width: 72; height: 72

    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
    }

    radius: 3

    Text {
        anchors.centerIn:  parent
        text: "" + parent.visualIndex
        color: "purple"
    }

    DragHandler {
        id: dragHandler
    }

    Drag.active: dragHandler.active
    Drag.source: icon
    Drag.hotSpot {
        x: 32
        y: 32
    }

    states: [
        State {
            when: dragHandler.active
            ParentChange {
                target: icon
                parent: icon.dragParent
            }
            AnchorChanges {
                target: icon
                anchors.verticalCenter: undefined
                anchors.horizontalCenter: undefined
            }
        }
    ]
}
