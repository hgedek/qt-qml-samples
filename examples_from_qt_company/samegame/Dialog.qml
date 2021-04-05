import QtQuick
import QtQml.Models

Rectangle {
    id: container

    property alias inputText: textInput.text

    signal closed

    function show(text) {
        dialogText.text = text;
        container.opacity = 1;
        textInput.opacity = 0;
    }

    function hide() {
        textInput.focus = false;
        container.opacity = 0;
        container.closed();
    }

    function showWithInput(text) {
        show(text);
        textInput.opacity = 1;
        textInput.focus = true;
        textInput.text = "";
    }

    Text {
        id: dialogText
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 10
        }
        text: ""
    }

    TextInput {
        id: textInput
        width: 50
        text: ""
        anchors {
            verticalCenter: parent.verticalCenter
            left: dialogText.right
            leftMargin: 10
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onClicked:  {
            if (textInput.text == "" && textInput.opacity > 0)
                Qt.inputMethod.show();
            else
                hide();
        }
    }
}
