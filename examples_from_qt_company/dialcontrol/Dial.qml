import QtQuick 2.0

Item {
   id: root

   property real value : 0.0

   width: 210; height: 210;

   Image { source: "images/background.png" }

   Image {
       x: 100; y: 35;
       source: "images/needle_shadow.png"
       transform: Rotation {
          origin {
              x: 9
              y: 67
          }

          angle: needleRotation.angle
       }
   }

   Image {
       id: needle
       x: 99; y: 33
       antialiasing: true
       source: "images/needle.png"

       transform: Rotation {
           id: needleRotation
           origin {
               x: 5
               y: 65
           }

           angle: Math.min(Math.max(-130, root.value * 2.5 - 130), 130)

           Behavior on angle {
               SpringAnimation {
                   spring: 1.4
                   damping: 0.15
               }
           }
       }
   }

   Image {
       x: 21; y: 18;
       source: "images/overlay.png"
   }
}
