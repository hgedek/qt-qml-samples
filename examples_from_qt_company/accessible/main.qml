import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("accessible")

    Column {
        id: column
        spacing: 10
        anchors.fill: parent
        anchors.margins: 10

        Text {
            id: status
            text: ""
        }

        Row {
            spacing: 5
            Button {
                id: sendButton
                width: 100
                height: 50
                text: "Send"
                onClicked: { status.text = "Send" }
                KeyNavigation.tab: discardButton
            }

            Button {
                id: discardButton
                width: 100
                height: 50
                text: "Discard"
                onClicked: { status.text = "Discard" }
                KeyNavigation.tab: checkBox
            }
        }

        Row {
            spacing: 5

            CheckBox {
                id: checkBox
                checked: false
                KeyNavigation.tab: slider
            }

            Slider {
                id: slider
                value: 10
            }
        }
    }
}
