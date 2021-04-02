import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true

    Rectangle {
        id: page
        anchors.fill: parent
        color: "#edecec"

        MouseArea {
            anchors.fill: parent
            onClicked: page.focus = false;
        }
        Column {
            anchors { horizontalCenter: parent.horizontalCenter; verticalCenter: parent.verticalCenter }
            spacing: 10

            SearchBox { id: search1; KeyNavigation.tab: search2; KeyNavigation.backtab: search3; focus: true }
            SearchBox { id: search2; KeyNavigation.tab: search3; KeyNavigation.backtab: search1 }
            SearchBox { id: search3; KeyNavigation.tab: search1; KeyNavigation.backtab: search2 }
        }
    }
}
