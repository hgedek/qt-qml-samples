import QtQuick 2.12
import QtQuick.Window 2.12

ListView {
    anchors.fill: parent

    required model

    delegate: Rectangle {
        required property string modelData

        height: 35
        width: 100

        Text {
            text: parent.modelData
        }
    }
}
