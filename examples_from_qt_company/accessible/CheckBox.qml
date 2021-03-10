import QtQuick 2.0

FocusScope {
    id: checkBox

    Accessible.role: Accessible.CheckBox

    property string text: "CheckBox"
    property bool checked

    width: 100
    height: 30

    Row {
        spacing: 2

        Rectangle {
            width: 12
            height: 12
            border.width: checkBox.focus ? 2 : 1
            border.color: "black"

            Text {
                id: checkBoxText
                text: checkBox.checked ? "X" : ""
                anchors.centerIn: parent
            }
        }

        Text {
            text: checkBox.text
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: checkBox.checked = !checkBox.checked
    }

    Keys.onSpacePressed: checkBox.checked = !checkBox.checked
}
