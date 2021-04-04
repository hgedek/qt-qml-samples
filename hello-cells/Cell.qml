import QtQuick 2.0

Item {
    id: contaniner

    property alias color: myrect.color

    signal clicked(color value)

    width: 40; height: 25

    Rectangle {
        id: myrect
        border.color: "green"
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: contaniner.clicked(contaniner.color)
    }
}
