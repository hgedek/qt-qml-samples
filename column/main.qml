import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("column")

    property real current_opacity: 1.0

    Timer {
       interval: 1000
       running: true
       repeat: true
       onTriggered: current_opacity = current_opacity == 0.0 ? 1.0 : 0.0
    }

    Column {
        anchors.fill: parent

        populate: Transition {
            NumberAnimation {
                property: "x,y"
                duration: 200
                easing: Easing.OutBounce
            }
        }

        add: Transition {
            NumberAnimation {
                property: "y"
                easing: Easing.OutQuad
            }
        }

        move: Transition {
            NumberAnimation {
                property: "y"
                easing: Easing.OutBounce
            }
        }


        Rectangle {
            color: "black"
            width: parent.width
            height: 50
            opacity: current_opacity
            Behavior on opacity { NumberAnimation {} }
        }

        Rectangle {
            color: "red"
            width: parent.width
            height: 100
            opacity: !current_opacity
            border.color: "transparent"
            Behavior on opacity { NumberAnimation {} }
        }

        Rectangle {
            color: "purple"
            width: parent.width
            height: 30
        }

        Rectangle {
            color: "green"
            width: parent.width
            height: 50
        }
    }
}
