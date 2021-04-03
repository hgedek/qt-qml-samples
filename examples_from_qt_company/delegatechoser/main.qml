import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQml.Models 2.12
import Qt.labs.qmlmodels 1.0

Window {
    width: 640
    height: 480
    visible: true

    ListModel {
        id: listModel

        ListElement { dataType: "rect"; color: "green" }
        ListElement { dataType: "image"; source: "qt-logo.png" }
        ListElement { dataType: "rect"; color: "green" }
        ListElement { dataType: "image"; source: "qt-logo.png" }
        ListElement { dataType: "rect"; color: "red" }
        ListElement { dataType: "rect"; color: "blue" }
        ListElement { dataType: "rect"; color: "blue" }
        ListElement { dataType: "rect"; color: "blue" }
        ListElement { dataType: "rect"; color: "blue" }
        ListElement { dataType: "rect"; color: "blue" }
    }

    ListModel {
        id: listModel2

        ListElement { dataType: "rect"; color: "blue" }
        ListElement { dataType: "rect"; color: "blue" }
        ListElement { dataType: "image"; source: "qt-logo.png" }
        ListElement { dataType: "rect"; color: "green" }
        ListElement { dataType: "image"; source: "qt-logo.png" }
        ListElement { dataType: "rect"; color: "green" }
        ListElement { dataType: "rect"; color: "blue" }
        ListElement { dataType: "rect"; color: "blue" }
        ListElement { dataType: "rect"; color: "blue" }
        ListElement { dataType: "rect"; color: "blue" }
        ListElement { dataType: "rect"; color: "blue" }
    }

    DelegateChooser {
        id: fancyDelegate
        role: "dataType"

        DelegateChoice {
            roleValue: "rect"
            delegate:  DelegateChooser {
                DelegateChoice {
                    row: 0
                    Rectangle {
                        width: parent.width
                        height: 30
                        color: "red"
                        border.color: "black"
                        border.width: 1
                    }
                }

                DelegateChoice {
                    Rectangle {
                        width: parent.width
                        height: 30
                        color: model.color
                        border.color: "yellow"
                        border.width: 1
                    }
                }
            }
        }

        DelegateChoice {
            roleValue: "image"
            delegate: Image {
                width: parent.width
                height: 100
                source: model.source
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    Item {
        anchors.fill: parent
        id: item

        RowLayout {
            ListView {
                Layout.preferredHeight: item.height
                Layout.preferredWidth: item.width * 0.5
                model: listModel
                delegate: fancyDelegate
            }

            ListView {
                Layout.preferredHeight: item.height
                Layout.preferredWidth: item.width / 2
                model: listModel2
                delegate: fancyDelegate
            }
        }
    }
}

