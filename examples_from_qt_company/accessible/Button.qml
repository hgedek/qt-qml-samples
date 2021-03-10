import QtQuick 2.12

Rectangle {
    id: button

    property bool checked: false
    property alias text: buttonText.text

    Accessible.name: text
    Accessible.role: Accessible.Button
    Accessible.onPressAction: {
        button.clicked()
    }

    signal clicked

    Text {
        id: buttonText
        anchors.centerIn: parent
        font.pixelSize: 12
        style:Text.Sunken
        color: "red"
        styleColor: "green"
    }

    radius: 10
    antialiasing: true

    height: 40
    width: buttonText.width + 20

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: parent.clicked()
    }

    // keys : attached
    Keys.onSpacePressed: clicked()
}

