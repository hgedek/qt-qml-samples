import QtQuick 2.12

Window {
    width: 400
    height: 400
    id: window
    visible: true

    Canvas {
        id: canvas
        anchors.fill: parent
        antialiasing: true

        onPaint: {
            var context = canvas.getContext("2d")
            context.clearRect(0,0,width,height)
            context.strokeStyle = "black"
            context.path = motionPath.path
            context.stroke()
        }
    }

    PathInterpolator {
        id: motionPath

        path: Path {
            startX: 50
            startY: 50

            PathCubic {
                x: window.width - 50
                y: window.height - 50

                control1X: x; control1Y: 50
                control2X: 50; control2Y: y
            }

            onChanged: canvas.requestPaint()
        }

        SequentialAnimation on progress {
            running: true
            loops: -1

            PauseAnimation {
                duration: 1000
            }

            NumberAnimation {
               id: progressAnim
               running: false
               from: 0; to: 1
               duration: 2000
               easing.type: Easing.InQuad
            }
        }
    }

    Rectangle {
        id: box

        width: 50
        height: 50

        antialiasing: true
        border.color: "black"
        border.width: 4

        x: motionPath.x
        y: motionPath.y

        rotation: motionPath.angle
        transform: Translate { x: -box.width/2; y: -box.height/2 }

        Text {
            anchors.centerIn: parent
            text: "Box"
        }
    }
}
