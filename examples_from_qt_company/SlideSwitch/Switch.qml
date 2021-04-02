import QtQuick

Item {
    id: toggleSwitch
    width: background.width
    height: background.height

    property bool on: false

    function toggle() {
        toggleSwitch.state = on == true ? "off" : "on"
    }

    function release() {
        if (knob.x == 0 && toggleSwitch.on == false) return;
        if (knob.x == 80 && toggleSwitch.on == true) return;

        toggle();
    }

    Image {
        id: background
        source: "images/background.png"

        MouseArea {
            anchors.fill: parent
            onClicked: toggle()
        }
    }

    Image {
        id: knob
        source: "images/knob.png"
        y: 5

        MouseArea {
            anchors.fill: parent
            drag {
                target: knob
                axis: Drag.XAxis
                minimumX: 0
                maximumX: 80
            }

            onReleased: {
                release()
            }
        }
    }

    states: [
        State {
            name: "on"
            PropertyChanges {
                target: knob

            }
            PropertyChanges {
                target: toggleSwitch
                on: true
            }
        },
        State {
            name: "off"
            PropertyChanges {
                target: knob
                x: 0
            }
            PropertyChanges {
                target: toggleSwitch
                on: false
            }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            target: knob
            properties: "x"
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }
}

