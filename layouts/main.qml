import QtQuick
import QtQuick.Window
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: bottom.top
        height: 100
        // layouts re good for resizable components
        RowLayout {
            anchors.fill: parent
            spacing: 10

            Rectangle {
                color: "red"
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: "azure"
                Layout.fillHeight: true
                Layout.preferredWidth: 150
            }
        }
    }

    Rectangle {
        id: bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: top.bottom
        // positioner good for static components
        Row {
            anchors.fill: parent
            spacing: 10

            Rectangle {
                color: "blue"
                width: 100
            }

            Rectangle {
                color: "green"
                height: 100
                width: 100
            }
        }
    }
}
