import QtQuick 2.12

FocusScope {
    id: focusScope
    width: 250; height: 30

    BorderImage {
        source: "images/lineedit-bg.png"
        width: parent.width; height: parent.height
        border { left: 4; right: 4; top: 4; bottom: 4 }
    }

    BorderImage {
        source: "images/lineedit-bg-focus.png"
        width: parent.width; height: parent.height
        border { left: 4; right: 4; bottom: 4; top: 4 }
        visible: parent.activeFocus ? true : false
    }

   Text {
       id: text
       anchors.fill: parent
       anchors.leftMargin: 8
       text: "Type something..."
       color: "gray"
       font.italic: true
   }

   MouseArea {
       anchors.fill: parent
       onClicked: { focusScope.focus = true; Qt.inputMethod.show(); }
   }

   TextInput {
       id: textInput
       anchors {
           left: parent.left
           right: clear.left
           leftMargin: 8
           rightMargin: 8
           verticalCenter: parent.verticalCenter
       }
       focus: true
       selectByMouse: true
   }

   Image {
       id: clear
       anchors {
           right: parent.right
           rightMargin: 8
           verticalCenter: parent.verticalCenter
       }
       source: "images/clear.png"
       opacity: 0
       MouseArea {
           anchors.fill: parent
           onClicked: {
               textInput.text = ""
               focusScope.focus = true
           }
       }
   }

   states: State {
       name: "hasText"; when: textInput.text != ""
       PropertyChanges {
           target: text
           opacity: 0
       }

       PropertyChanges {
           target: clear
           opacity: 1
       }
   }

   transitions: [
       Transition {
           from: ""; to:"hasText"
           NumberAnimation {
               exclude: text;
               properties: "opacity"
           }
       },

       Transition {
           from: "hasText"; to: ""
           NumberAnimation {
               properties: "opacity"
           }
       }
   ]
}
