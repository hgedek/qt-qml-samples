import QtQuick 2.0

Item {
    id: progressbar

    property int minimum: 0
    property int maximum: 100
    property int value: 0

    property alias color: gradient1.color
    property alias secondcolor: gradient2.color

    width: 250
    height: 25

    clip: true

    BorderImage {
        id: border
        source: "background.png"
        width: progressbar.width; height: progressbar.height
        border.left: 5; border.top: 5
        border.right: 5; border.bottom: 5
    }

    Rectangle {
        id: highlight

        property int widthDest: ((progressbar.width * (value - minimum)) / (maximum - minimum) - 6)

        width: highlight.widthDest

        Behavior on width {
            SmoothedAnimation {
                velocity: 100
            }
        }

        anchors { left: parent.left; top: parent.top; bottom: parent.bottom }
        anchors.margins: 3

        radius: 1

        gradient: Gradient {
            GradientStop {
                id: gradient1
                position: 0.0
            }

            GradientStop {
                id: gradient2
                position: 1.0
            }
        }
    }

    Text {
        id: text
        anchors { right: highlight.right; rightMargin: 6; verticalCenter: parent.verticalCenter }
        color: "white"
        font.bold: true
        text: Math.floor((value - minimum) / (maximum - minimum) * 100) + "%"
    }
}
