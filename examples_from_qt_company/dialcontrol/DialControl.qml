import QtQuick 2.2
import QtQuick.Window 2.1


Rectangle {
    color: "#545454"
    width: 300; height: 300

    Dial {
        id: dial
        anchors.centerIn: parent
        value: container.value
    }

    Rectangle {
        id: container

        property int oldWidth: 0

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            leftMargin: 20
            rightMargin: 20
            bottomMargin: 30
        }

        height: 15

        radius: 8
        opacity: 0.7
        antialiasing: true

        gradient: Gradient {
            GradientStop { position: 0; color: "gray" }
            GradientStop { position: 1.0; color: "white" }
        }

        onWidthChanged: {
            if (oldWidth == 0) {
                oldWidth = width;
                return;
            }

            var desiredPercent = slider.x * 100 / (oldWidth - 32);
            slider.x = desiredPercent * (width - 32) / 100;
            oldWidth = width;
        }

        property real value: 0.0

        Rectangle {
            id: slider
            x: 1; y: 1; width: 30; height: 14
            radius: 8
            antialiasing: true

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#424242" }
                GradientStop { position: 1.0; color: "black" }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -5
                drag.target: parent
                drag.axis: Drag.XAxis
                drag.minimumX: 2
                drag.maximumX: container.width -32
            }

            onXChanged: parent.value = x * 100 / (container.width - width);
        }

    }

    QuitButton {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 10
    }
}
