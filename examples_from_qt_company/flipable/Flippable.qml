import QtQuick 2.0

Rectangle {
    id: root
    color: "darkgreen"

    Row {

        spacing: 30

        Card { source: "images/9_club.png"; angle: 180; yAxis: 1 }
        Card { source: "images/5_heart.png"; angle: 540; xAxis: 1 }
    }
}
