import QtQuick 2.12
import QtQuick.Window 2.12

ListView {
    width: 200; height: 250

    required model

    delegate: Text {
        required property string type
        required property string size

        text: "Animal: " + type + ", " + size
    }
}
