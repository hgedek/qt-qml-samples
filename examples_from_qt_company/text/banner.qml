import QtQuick 2.12

Window {
    id: window
    width: 640
    height: 480
    visible: true

    Rectangle {
        anchors.fill: parent
        id: screen

        property int pixelSize: parent.height * 1.25
        property color textColor: "lightsteelblue"
        property string text: "Hello Fonts"

        color: "green"

        Row {
            y: -parent.height / 4.5

            NumberAnimation on x {
                from: 0
                to: -text.width
                duration: 6000
                loops: -1
            }

            Text { id: text; font.pixelSize: screen.pixelSize; color: screen.textColor; text: screen.text }
            Text { font.pixelSize: screen.pixelSize; color: screen.textColor; text: screen.text }
            Text { font.pixelSize: screen.pixelSize; color: screen.textColor; text: screen.text }
        }
    }
}
