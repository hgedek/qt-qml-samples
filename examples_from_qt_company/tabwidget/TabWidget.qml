import QtQuick 2.0

Item {
    id: tabWidget

    default property alias content: stack.children

    property int current: 0

    onCurrentChanged: setOpacities()

    Component.onCompleted: setOpacities()

    function setOpacities() {
        for (var i = 0; i < stack.children.length; ++i) {
            stack.children[i].opacity = (i == current) ? 1: 0;
        }
    }

    Row {
        id: header

        Repeater {
            model: stack.children.length

            delegate: Rectangle {

                width: tabWidget.width/stack.children.length;
                height: 36

                Rectangle {
                    width: parent.width;
                    height: 1
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 1
                    color: "#acb2c2"
                }

                BorderImage {
                    anchors.fill: parent
                    source: "images/tab.png"
                    anchors.leftMargin: 2
                    anchors.rightMargin: 2
                    border.left: 4
                    border.right: 4

                    opacity: tabWidget.current == index
                }

                Text {
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    anchors.fill: parent
                    text: stack.children[index].title
                    elide: Text.ElideRight
                    font.bold: tabWidget.current == index
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: tabWidget.current = index
                }
            }
        }
    }

    Item {
        id: stack
        width: tabWidget.width
        anchors.top: header.bottom
        anchors.bottom: tabWidget.bottom
    }
}
