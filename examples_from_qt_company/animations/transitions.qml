import QtQuick 2.12

Window {
    id: window
    width: 480
    height: 360
    visible: true

    Rectangle {
        anchors.fill: parent
        id: page

        Image {
            id: userIcon
            source: "images/face-smile.png"
            x: topLeftRect.x
            y: topLeftRect.y
        }

        Rectangle {
            id: topLeftRect
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.topMargin: 10
            width: userIcon.width
            height: userIcon.height
            color: "transparent"
            border.color: "gray"
            radius: 10

            MouseArea {
                anchors.fill: parent
                onClicked: page.state = ""
            }
        }

        Rectangle {
            id: middleRightRect
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
            width: userIcon.width
            height: userIcon.height
            color: "transparent"
            border.color: "gray"
            radius: 10

            MouseArea {
                anchors.fill: parent
                onClicked: page.state = "middleRight"
            }
        }

        Rectangle {
            id: bottomLeftRect
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            width: userIcon.width
            height: userIcon.height
            color: "transparent"
            border.color: "gray"
            radius: 10

            MouseArea {
                anchors.fill: parent
                onClicked: page.state = "bottomLeft"
            }
        }

        states: [
            State {
                name: "middleRight"
                PropertyChanges {
                    target: userIcon
                    x: middleRightRect.x
                    y: middleRightRect.y
                }
            },

            State {
                name: "bottomLeft"
                PropertyChanges {
                    target: userIcon
                    x: bottomLeftRect.x
                    y: bottomLeftRect.y
                }
            }
        ]

        transitions: [
            Transition {
                 from: "*"
                 to: "middleRight"
                 NumberAnimation {
                    properties: "x,y"
                    easing.type: Easing.OutBounce
                    duration: 1000
                 }
            },

            Transition {
                from: "*"
                to: "bottomLeft"
                NumberAnimation {
                    properties: "x,y"
                    easing.type: Easing.OutExpo
                    duration: 1000
                }
            },

            Transition {
                NumberAnimation {
                    properties: "x,y"
                    duration: 1000
                    easing.type: Easing.OutExpo
                }
            }
        ]
    }
}
