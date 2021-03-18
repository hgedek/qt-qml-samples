import QtQuick 2.12

Window {
    id: window
    width: 640
    height: 480
    visible: true

    Rectangle {
        id: root
        anchors.fill: parent

        property string text: "fdsfdsfdsfdsfdsfdsfdsfdfds"

        color: "steelblue"

        FontLoader {
            id: localFont
            source: "contents/fonts/tarzeau_ocr_a.ttf"
        }

        FontLoader {
            id: webFont
            source: "http://www.princexml.com/fonts/steffmann/Starburst.ttf"
        }

        Column {
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.topMargin: 10
            spacing: 10

            Text {
                text: root.text
                color: "lightsteelblue"
                width: parent.width
                wrapMode: Text.WordWrap
                font.family: "Times"
                font.pixelSize: 20
            }

            Text {
                text: root.text
                color: "lightsteelblue"
                width: parent.width
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                font {
                    family: "Times"; pixelSize: 20; capitalization: Font.AllUppercase
                }
            }

            Text {
                text: root.text
                color: "lightsteelblue"
                width: parent.width
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignRight
                font {
                    family: "Courier"; pixelSize: 20; capitalization: Font.AllLowercase; weight: Font.Bold
                }
            }

            Text {
                text: root.text
                color: "lightsteelblue"
                width: parent.width
                wrapMode: Text.WordWrap
                font {
                    family: localFont.name; pixelSize: 20; capitalization: Font.Capitalize
                }
            }

            Text {
               text : {
                   if (webFont.status == FontLoader.Ready) root.text
                   else if (webFont.status == FontLoader.Loading) "Loading..."
                   else if (webFont.status == FontLoader.Error) "Error loading font"
               }

               color: "lightsteelblue"
               width: parent.width
               wrapMode: Text.WordWrap
               font.family: webFont.name
               font.pixelSize: 20
            }
            Item {
                height: 30
                width: parent.width
            }

            ListView {
                width: parent.width
                height: 100
                model: Qt.fontFamilies()

                delegate: Item {
                    height: 30
                    width: ListView.view.width

                    required property string modelData
                    required property int index

                    Text {
                        anchors.centerIn: parent
                        text: parent.modelData + " " + index
                        font.family: localFont.name
                        font.pixelSize: 20
                        color: "white"
                    }
                }
            }
        }
    }
}
