import QtQuick 2.0

Image {
    property alias model: view.model
    property alias delegate: view.delegate
    property alias currentIndex: view.currentIndex

    property real itemHeight: 30

    source: "images/spinner-bg.png"
    clip: true
    PathView {
        id: view
        anchors.fill: parent

        pathItemCount: height/itemHeight
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlight: Image {
            source: "images/spinner-select.png"
            width: view.width
            height: itemHeight + 4
        }

        dragMargin: view.width

        path: Path {
            startX: view.width/2
            startY: -itemHeight/2

            PathLine {
                relativeX: 0
                relativeY: itemHeight * view.pathItemCount + 100
            }
        }
    }

    Keys.onDownPressed: view.incrementCurrentIndex()
    Keys.onUpPressed: view.decrementCurrentIndex()
}
