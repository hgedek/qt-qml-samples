import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: myrect
        width: 100
        height: 100
        focus: true
        color: "grey"
        anchors.centerIn: parent

        Keys.onPressed: (param) => {
            console.log(param.key)
            if (param.key == Qt.Key_A) console.log("A")
            if (param.key == Qt.Key_B) console.log("B")
        }
    }
}
