import QtQuick 2.0

Item {
    id: toggleSwitch

    property bool on: false

    function toggle() {
        toggleSwitch.state = toggleSwitch.state == "on" ? "off" : "on"
    }

    function releaseSwitch() {
        if (knob.x == 1) {
            if (toggleSwitch.state == "off") return;
        }

        if (knob.x == 70)
            if (toggleSwitch.state == "on") return;

        toggle();
    }

    Image {
        id: background
        source: "images/background.png"
        MouseArea { anchors.fill: parent; onClicked: toggle() }
    }

    Image {
        id: knob
        x: 1; y: 1
        source: "images/knob.png"

        MouseArea {
            anchors.fill: parent
            drag.target: knob; drag.axis: Drag.XAxis; drag.minimumX: 1; drag.maximumX: 70
            onClicked: toggle()
            onReleased: releaseSwitch()
        }
    }

    states: [
        State {
            name: "on"
            PropertyChanges {
                target: knob
                x: 70
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
                x: 1
            }

            PropertyChanges {
                target: toggleSwitch
                on: false
            }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            easing.type: Easing.InOutExpo
            properties: "x"
            duration: 200
        }
    }
}
