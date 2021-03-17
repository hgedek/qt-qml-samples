import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    id: window

    property int margin: 11

    Component.onCompleted: {
        width = mainLayout.implicitWidth + 2 * margin
        height = mainLayout.implicitHeight + 2 * margin
    }

    minimumWidth: 0
    minimumHeight: 0

    ColumnLayout {
        id: mainLayout
        anchors.fill: parent
        anchors.margins: window.margin

        GroupBox {
            id: rowBox
            title: "Row Layout"
            Layout.fillWidth: true
            Layout.minimumWidth: rowLayout.Layout.minimumWidth + 30
            padding: 0

            RowLayout {
                id: rowLayout
                anchors.fill: parent

                TextField {
                    placeholderText: "This wants to grow horizontally"
                    Layout.fillWidth: true
                }

                Button {
                    text: "Click Me"
                }
            }
        }

        GroupBox {
            id: gridBox
            title: "Grid layout"
            Layout.fillWidth: true
            padding: 0
            Layout.minimumWidth: gridLayout.Layout.minimumWidth + 30

            GridLayout {
                id: gridLayout
                rows: 3
                flow: GridLayout.TopToBottom
                anchors.fill: parent

                Label { text: "Line 1" }
                Label { text: "Line 2" }
                Label { text: "Line 3" }

                TextField {}
                TextField {}
                TextField {}

                TextArea {
                    text: "This widget spans over three rows in the GridLayout.\n"
                        + "All items in the GridLayout are implicitly positioned from top to bottom."
                    wrapMode: TextArea.WordWrap

                    Layout.rowSpan: 3
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.minimumHeight: implicitHeight
                    Layout.minimumWidth: 100
                    Layout.maximumHeight: 200
                }
            }
        }

        TextArea {
            id: t3
            text: "This fills whole cell"
            Layout.minimumHeight: 30
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        GroupBox {
            id: stackBox
            title: "Stack Level"
            implicitWidth: 200
            implicitHeight: 60
            padding: 0
            Layout.minimumHeight: 60
            Layout.fillWidth: true
            Layout.fillHeight: true

            StackLayout {
                id: stackLayout
                anchors.fill: parent

                function advance() { currentIndex = (currentIndex + 1) % 3 }

                Repeater {
                    id: stackRepeater
                    model: 5
                    Rectangle{
                        required property int index
                        color: Qt.hsla((0.5 + index) / stackRepeater.count, 0.4, 0.7, 1)
                        Button {
                            anchors.centerIn: parent
                            text: "Page " + (parent.index + 1)
                            onClicked: {
                                stackLayout.advance();
                            }
                        }
                    }
                }
            }
        }
    }
}
