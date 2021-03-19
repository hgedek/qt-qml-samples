import QtQuick 2.12
import QtQuick.Window 2.12

ListView {
    width: 640
    height: 480

    required model

    delegate: Rectangle {
        required color
        required property string name

        height: 25
        width: 100

        Text {
            text: parent.name
        }
    }
}
