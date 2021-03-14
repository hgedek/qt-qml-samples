import QtQuick 2.12

Window {
    id: window
    width: 640
    height: 480
    visible: true

    Rectangle {
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
            bottom: parent.verticalCenter
        }
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#14148c" }
            GradientStop { position: 1.0; color: "#14aaff" }
        }
    }

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            top: parent.verticalCenter
        }

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#80c342" }
            GradientStop { position: 1.0; color: "#006325" }
        }
    }

    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        y: smiley.minHeight + 50
        source: "images/shadow.png"

        scale: smiley.y * 0.5 / (smiley.minHeight - smiley.maxHeight)
    }

    Image {
        id: smiley

        property int maxHeight: window.height / 3
        property int minHeight: 2 * window.height / 3

        anchors.horizontalCenter: parent.horizontalCenter
        y: minHeight
        source: "images/face-smile.png"

        SequentialAnimation on y {

            loops: Animation.Infinite

            NumberAnimation {
                from: smiley.minHeight; to: smiley.maxHeight
                easing.type: Easing.OutExpo; duration: 300
            }

            NumberAnimation {
                from: smiley.maxHeight; to: smiley.minHeight
                easing.type: Easing.OutBounce
                duration: 1000
            }

            PauseAnimation {
                duration: 200
            }
        }
    }
}
