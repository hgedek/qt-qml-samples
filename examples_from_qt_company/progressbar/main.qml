import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true

    Rectangle {
      anchors.fill: parent
      color: "#edecec"
      id: root

      Flickable {
          anchors.fill: parent
          contentHeight: column.height + 70

          Column {
              id: column
              x: 10; y: 10
              spacing: 10

              Repeater {
                  model: 20

                  Progressbar {
                      property int r: Math.floor(Math.random() * 5000 + 1000)
                      width: root.width - 20

                      NumberAnimation on value {
                          duration: r;
                          from: 0
                          to: 100
                          loops: Animation.Infinite
                      }


                      ColorAnimation on color {
                          from: "lightsteelblue"
                          to: "thistle"
                          duration: r
                          loops: Animation.Infinite
                      }


                      ColorAnimation on secondcolor {
                          from: "steelblue"
                          to: "#edecec"
                          duration: r
                          loops: Animation.Infinite
                      }
                  }
              }
          }
      }
    }
}

