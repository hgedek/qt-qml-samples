import QtQuick
import QtQuick.Particles

Item {
    id: block

    property int type: 0
    property bool dying: false

    property bool spawned: false

    Behavior on x {
        enabled: spawned
        SpringAnimation { spring: 2; damping: 0.2 }
    }

    Behavior on y {
        SpringAnimation {
            spring: 2
            damping: 0.2
        }
    }

    Image {
        id: img

        anchors.fill: parent
        source: {
            if (type == 0) return "images/redStone.png";
            else if (type == 1) return "images/blueStone.png";
            else
                return "images/greenStone.png";
        }

        opacity: 0

        Behavior on opacity {
          NumberAnimation {
              duration: 200
          }
        }
    }

    ParticleSystem {
        id: sys
        anchors.centerIn: parent

        ImageParticle {
            source: {
                if (type == 0)
                    return "images/redStar.png";
                else if (type == 1)
                    return "images/blueStar.png";
                else
                    return "images/greenStar.png";
            }

            rotationVelocityVariation: 360
        }

        Emitter {
            id: particles
            anchors.centerIn: parent
            emitRate: 0
            lifeSpan: 700
            velocity: AngleDirection {
                angleVariation: 360
                magnitude: 80
                magnitudeVariation: 40
            }
            size: 16
        }
    }

    states: [
        State {
            name: "Alive"
            when: spawned == true && dying == false
            PropertyChanges {
                target: img
                opacity: 1
            }
        },
        State {
            name: "Death"
            when: dying == true
            StateChangeScript {
                script: particles.burst(50)
            }
            PropertyChanges {
                target: img
                opacity: 0
            }
            StateChangeScript {
                script: block.destroy(1000)
            }
        }
    ]
}
