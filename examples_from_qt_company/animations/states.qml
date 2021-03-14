import QtQuick 2.12

Window {
    id: window
    width: 400
    height: 400
    visible: true

    Rectangle {
        id: page
        anchors.fill: parent
        color: "Transparent"

        state: ""

        Image {
            id: userIcon
            x: topLeftRect.x;
            y: topLeftRect.y
            source: "images/face-smile.png"
        }

        Rectangle {
            id: topLeftRect

            anchors {
                left: parent.left
                top: parent.top
                leftMargin: 10
                topMargin: 10
            }

            width: userIcon.width
            height: userIcon.height
            color: "Transparent"
            border.color: "Gray"
            radius: 10

            MouseArea { anchors.fill: parent; onClicked: page.state = "" }
        }

        Rectangle {
            id: middleRightRect

            anchors { right: parent.right; verticalCenter: parent.verticalCenter; rightMargin: 10 }

            width: userIcon.width
            height: userIcon.height

            color: "Transparent"; border.color: "Gray"; radius: 10

            MouseArea { anchors.fill: parent; onClicked: page.state = "middleRight" }
        }

        Rectangle {
            id: bottomLeftRect

            anchors { left: parent.left; bottom: parent.bottom; leftMargin: 10; bottomMargin: 10 }

            width: userIcon.width
            height: userIcon.height
            color: "Transparent"; border.color: "Gray"; radius: 10

            MouseArea { anchors.fill: parent; onClicked: page.state = "bottomLeft" }
        }

        Rectangle {
            id: topRightRect

            anchors { right: parent.right; top: parent.top; topMargin: 10; rightMargin: 10 }
            width: userIcon.width
            height: userIcon.height
            color: "transparent"; border.color: "gray"; radius: 10

            MouseArea { anchors.fill: parent; onClicked: page.state = "" }
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
    }
}
