import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Flow {
        id: flow
        flow: Flow.TopToBottom

        anchors.fill: parent
        spacing: 5

        Rectangle {
            color: "black"; width: 50; height: 50
        }
        Rectangle {
            color: "red"; width: 50; height: 50
        }

        Rectangle {
            color: "black"; width: 50; height: 50
        }
        Rectangle {
            color: "red"; width: 50; height: 50
        }

        Rectangle {
            color: "black"; width: 50; height: 50
        }
        Rectangle {
            color: "red"; width: 50; height: 50
        }

        Rectangle {
            color: "black"; width: 50; height: 50
        }
        Rectangle {
            color: "red"; width: 50; height: 50
        }

        Rectangle {
            color: "black"; width: 50; height: 50
        }
        Rectangle {
            color: "red"; width: 50; height: 50
        }

        Rectangle {
            color: "black"; width: 50; height: 50
        }
        Rectangle {
            color: "red"; width: 50; height: 50
        }
        Rectangle {
            color: "black"; width: 50; height: 50
        }
        Rectangle {
            color: "red"; width: 50; height: 50
        }
    }
}
