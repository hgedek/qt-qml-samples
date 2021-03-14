import QtQuick 2.12

Window {
    width: 640
    height: 480
    visible: true

    Rectangle {
        id: window
        anchors.fill: parent
        focus: true

        property string text: "Drag me!"
        property bool animated: true

        Keys.onPressed: (event) => {
          if (event.key == Qt.Key_Delete || event.key == Qt.Key_Backspace)
            window.remove()
          else if (event.text != "" )
            window.append(event.text)
        }

        Keys.onReleased: {
            console.log("released")
        }

        function append(text) {
            window.animated = false

            var lastletter = window.children[window.children.lenght -1]
            var newletter = letterComponent.createObject(window)
            newletter.text = text
            newletter.follow = lastletter
            window.animated = true
        }

        function remove() {
            if (window.children.length)
                window.children[window.children.length-1].destroy()
        }

        function doLayout() {
            var follow = null

            for (var i = 0; i < window.text.length; ++i) {
                var newLetter = letterComponent.createObject(window)
                newLetter.text = window.text[i]
                newLetter.follow = follow
                follow = newLetter
            }
        }

        Component {
            id: letterComponent

            Text {
                id: letter
                property var follow

                x: follow ? follow.x + follow.width : window.width / 6
                y: follow ? follow.y : window.height / 2

                font.pixelSize: 40; font.bold: true
                color: "#999999"; styleColor: "#222222"; style: Text.Raised

                MouseArea {
                    anchors.fill: parent
                    drag.target: letter;
                    drag.axis: Drag.XAndYAxis
                    onPressed: letter.color = "#dddddd"
                    onReleased: letter.color = "#999999"
                }

                Behavior on x {
                    enabled: window.animated
                    SpringAnimation {
                        spring: 3
                        damping: 0.3
                        mass: 1.0
                    }
                }

                Behavior on y {
                    enabled: window.animated
                    SpringAnimation {
                        spring: 3
                        damping: 0.3
                        mass: 1.0
                    }
                }
            }
        }

        Component.onCompleted: doLayout()
    }

}
