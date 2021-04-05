import QtQuick

Rectangle {
    id: container

    property alias text: buttonText.text

    signal clicked

    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: {
                if (mouseArea.pressed)
                    return activePalette.dark
                else
                    return activePalette.light
            }
        }

        GradientStop {
            position: 1.0
            color: activePalette.button
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: container.clicked()
    }

    Text {
        id: buttonText
        text: "Button"
        anchors.centerIn: parent
        color: activePalette.buttonText
    }
}
