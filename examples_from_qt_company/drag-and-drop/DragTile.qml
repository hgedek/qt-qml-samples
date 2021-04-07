import QtQuick 2.0

Item {
    id: root

    width: 64; height: 64

    required property string colorKey
    required property int modelData // from delegate

    MouseArea {
        id: mouseArea
        anchors.centerIn:  parent
        width: 64; height: 64

        drag.target:  tile
        onReleased: parent = tile.Drag.target !== null ? tile.Drag.target : root

        Rectangle {
            id: tile
            width: 64; height: 64

            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: colorKey

            Drag.keys: [colorKey]
            Drag.active: mouseArea.drag.active

            Text {
                anchors.fill: parent
                anchors.centerIn: parent
                text: root.modelData + 1
                font.pixelSize: 30
            }

            states: State {
                when: mouseArea.drag.active
                ParentChange { target: tile; parent: root }
                AnchorChanges {
                    target: tile
                    anchors.horizontalCenter: undefined
                    anchors.verticalCenter: undefined
                }
            }
        }
    }
}
