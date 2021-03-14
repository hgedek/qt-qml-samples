import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // if there are more focus: true components
    // focusscope will get the focus
    FocusScope {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        height: 100
        id: fs
        focus: true

        Rectangle {
            anchors.fill: parent
            color: "yellow"

            TextInput {
                width: parent.width
                anchors.centerIn: parent
                height: 30
                focus: true
                KeyNavigation.tab: nextInput
            }
        }
    }

    Rectangle {
        anchors.top: fs.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "green"

        TextInput {
            id: nextInput
            focus: true
            width: parent.width
            height: 30
            anchors.centerIn: parent
        }
    }
}
