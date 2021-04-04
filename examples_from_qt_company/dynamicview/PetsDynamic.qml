import QtQuick 2.0
import QtQml.Models 2.1

Rectangle {
    id: root

    Component {
        id : dragDelegate

        MouseArea {
            id: dragArea

            property bool held: false

            anchors { left: parent.left; right: parent.right }
            height: content.height

            enabled: visualModel.sortOrder == visualModel.lessThan.length

            drag.target: held ? content : undefined
            drag.axis: Drag.YAxis

            onPressAndHold: held = true
            onReleased: held = false

            Rectangle {
                id: content
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }

                width: dragArea.width
                height: column.implicitHeight + 5

                border.width: 1
                border.color: "lightsteelblue"

                color: dragArea.held ? "lightsteelblue" : "white"
                Behavior on color { ColorAnimation { duration: 200 }}

                radius: 2

                Drag.active: dragArea.held
                Drag.source: dragArea
                Drag.hotSpot.x: width/2
                Drag.hotSpot.y: height/2

                states: State {
                    when: dragArea.held

                    ParentChange { target: content; parent: root }
                    AnchorChanges {
                        target: content
                        anchors { verticalCenter: undefined; horizontalCenter: undefined }
                    }
                }

                Column {
                    id: column
                    Text { text: "Name: " + name }
                    Text { text: "Type: " + type }
                    Text { text: "Size: " + size }
                    Text { text: "Age: " + age }
                }
            }

            DropArea {
                anchors { fill: parent; margins: 10 }
                onEntered: (drag) => {
                   visualModel.items.move(
                       drag.source.DelegateModel.itemsIndex,
                       dragArea.DelegateModel.itemsIndex
                   )

               }
            }
        }
    }

    DelegateModel {
        id: visualModel

        property var lessThan: [
            function (left, right) { return left.name < right.name; },
            function (left, right) { return left.type < right.type; },
            function (left, right) { return left.age < right.age; },
            function (left, right) {
                if (left.size == "Small")
                    return true
                else if (right.size == "Small")
                    return false
                else if (left.size == "Medium")
                    return true
                else
                    return false
            }
        ]

        property int sortOrder: orderSelector.selectedIndex
        onSortOrderChanged: items.setGroups(0, items.count, "unsorted")

        function insertPosition(less, item) {
            var lower = 0
            var upper = items.count

            while (lower < upper ) {
                var middle = Math.floor(lower + (upper-lower)/2)
                var result = less(item.model, items.get(middle).model)
                if (result)
                    upper = middle
                else
                    lower = middle + 1
            }

            return lower
        }

        function sort(lessThan) {
            while (unsortedItems.count > 0) {
                var item = unsortedItems.get(0)
                var index = insertPosition(lessThan, item)
                item.groups = "items"
                items.move(item.itemsIndex, index)
            }
        }

        items.includeByDefault: false

        groups: DelegateModelGroup {
            id: unsortedItems
            name: "unsorted"

            includeByDefault: true

            onChanged: {
                if (visualModel.sortOrder == visualModel.lessThan.length)
                    setGroups(0, count, "items")
                else
                    visualModel.sort(visualModel.lessThan[visualModel.sortOrder])
            }
        }

        model: PetsModel{}
        delegate: dragDelegate
    }

    ListView {
        id: view
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: orderSelector.top
            margins: 2
        }

        model: visualModel
        spacing: 4
        cacheBuffer: 45
    }

    ListSelector {
        id: orderSelector
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 2
        }

        label: "Sort By"
        list: ["Name", "Size","Age","Type", "Custom"]
    }
}
