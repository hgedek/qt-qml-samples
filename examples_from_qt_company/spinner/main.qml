import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true

    Column {
        x: 20; y: 20; spacing: 20

        Spinner {
            id: spinner
            width: 200
            height: 240
            focus: true
            model: 20
            itemHeight: 30

            delegate: Text {
                font.pixelSize: 25
                text: index
                height: 30
            }
        }
        Text {
            text: "current index: " + spinner.currentIndex
        }
    }
}
