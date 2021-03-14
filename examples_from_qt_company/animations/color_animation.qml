import QtQuick 2.12
import QtQuick.Particles 2.12

Window {
    id: window
    width: 480
    height: 640
    visible: true

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.verticalCenter
        }

        gradient: Gradient {
                    GradientStop {
                        position: 0.0
                        SequentialAnimation on color {
                            loops: Animation.Infinite
                            ColorAnimation { from: "#14148c"; to: "#0E1533"; duration: 5000 }
                            ColorAnimation { from: "#0E1533"; to: "#14148c"; duration: 5000 }
                        }
                    }
                    GradientStop {
                        position: 1.0
                        SequentialAnimation on color {
                            loops: Animation.Infinite
                            ColorAnimation { from: "#14aaff"; to: "#437284"; duration: 5000 }
                            ColorAnimation { from: "#437284"; to: "#14aaff"; duration: 5000 }
                        }
                    }
                }
    }


    Item {
        width: parent.width
        height: 2 * parent.height

        NumberAnimation on rotation {
            from: 0
            to: 360
            duration: 10000
            loops: Animation.Infinite
        }

        Image {
            source: "images/sun.png"; y: 10; anchors.horizontalCenter: parent.horizontalCenter
            rotation: -3 * parent.rotation
        }

        Image {
            source: "images/moon.png"; y: parent.height - 80; anchors.horizontalCenter: parent.horizontalCenter
            rotation: -parent.rotation
        }

        ParticleSystem {
            id: particleSystem
            x: 0;
            y: parent.height/2
            width: parent.width
            height: parent.height
            ImageParticle {
                source: "images/star.png"
                groups: ["star"]
                color: "#00FFFFFF"
                SequentialAnimation on opacity {
                    loops: Animation.Infinite
                    NumberAnimation { from: 0; to: 1; duration: 5000 }
                    NumberAnimation { from: 1; to: 0; duration: 5000 }
                }
            }

            Emitter {
                group: "star"
                anchors.fill: parent
                emitRate: parent.width / 40
                lifeSpan: 5000
            }
        }
    }

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            top: parent.verticalCenter
            bottom: parent.bottom
        }

        gradient: Gradient {
            GradientStop {
                position: 0.0
                SequentialAnimation on color {
                    loops: Animation.Infinite
                    ColorAnimation { from: "#80c342"; to: "#001600"; duration: 5000 }
                    ColorAnimation { from: "#001600"; to: "#80c342"; duration: 5000 }
                }
            }
        }
    }
}
