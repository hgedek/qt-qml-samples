import QtQuick 2.12

Window {
    id: window
    visible: true
    width: 640
    height: 480

    Rectangle {
        property string text;

        x: 0
        y: 0
        width: 100; height: 100
        radius: 10
        border.width: 4
        border.color: "blue"
        color: "firebrick"

        Behavior on x {
            NumberAnimation {
                easing.type: Easing.OutElastic
                easing.amplitude: 3
                easing.period: 2
                duration: 200
            }
        }


        Behavior on y {
            NumberAnimation {
                easing.type: Easing.OutElastic
                easing.amplitude: 3
                easing.period: 8
                duration: 400
            }
        }

        Text {
            id: focusText
            text: parent.text
            anchors.centerIn: parent
            color: "red"
            font.pixelSize: 14
            font.bold: true

            Behavior on text {
               SequentialAnimation {
                   loops: Animation.Infinite

                   NumberAnimation {
                       target: focusText
                       property: "opacity"
                       to: 0
                       duration: 500
                   }

                   NumberAnimation {
                       target: focusText
                       property: "opacity"
                       to: 1
                       duration: 500
                   }
               }
            }
        }
    }
}

