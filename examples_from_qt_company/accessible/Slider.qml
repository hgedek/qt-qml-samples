import QtQuick 2.0

Rectangle {
    id: slider

    property alias text: buttonText.text

    Accessible.role: Accessible.Slider

    property int value: 5
    property int minimumValue: 0
    property int maximumValue: 50
    property int stepSize: 1

    width: 100
    height: 30
    border.color: "black"
    border.width: 1

    Rectangle {
        id: indicator
        x: 1
        y: 1
        height: parent.height - 2
        width: ((parent.width - 2) / slider.maximumValue) * slider.value
        color: "grey"

        Behavior on width {
            NumberAnimation { duration: 40 }
        }
    }

    Text {
        id: buttonText
        text: parent.value
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: (mouse) => {
            console.log("clicked")
            var pos = mouse.x / slider.width * (slider.maximumValue - slider.minimumValue) +
                       slider.minimumValue;
            slider.value = pos
       }
    }

    Keys.onLeftPressed: {
        console.log("here")
        slider.value > minimumValue ? slider.value = slider.value - stepSize : minimumValue
    }

    Keys.onRightPressed: slider.value < maximumValue ? slider.value = slider.value + stepSize : maximumValue
}
