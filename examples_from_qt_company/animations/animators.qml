import QtQuick

Window {
   id: window
   visible: true
   width: 640
   height: 480

   Rectangle {
       anchors.fill: parent

       gradient: Gradient {
           GradientStop { position: 0.0; color:"#15148c" }
           GradientStop { position: 0.5; color: "#14aaff" }
           GradientStop { position: 1.0; color: "#006325" }
       }
   }


   SequentialAnimation {
       SequentialAnimation {
           ParallelAnimation {
              YAnimator {
                  target: smiley
                  from: smiley.minHeight
                  to: smiley.maxHeight
                  easing.type: Easing.OutExpo
                  duration: 300
              }

              ScaleAnimator {
                  target: shadow
                  from: 1
                  to: 0.4
                  easing.type: Easing.OutExpo
                  duration: 300
              }
           }

           ParallelAnimation {
               YAnimator {
                   target: smiley
                   from: smiley.maxHeight
                   to: smiley.minHeight
                   easing.type: Easing.OutBounce
                   duration: 1000
               }

               ScaleAnimator {
                   target: shadow
                   from: 0.4
                   to: 1.0
                   easing.type: Easing.OutBounce
                   duration: 1000
               }
           }
       }


       PauseAnimation {
           duration: 1000
       }

       running: true
       loops: Animation.Infinite
   }

   Image {
       id: shadow
       anchors.horizontalCenter: parent.horizontalCenter
       y: smiley.minHeight + smiley.height
       source: "images/shadow.png"
   }

   Image {
       id: smiley
       property int maxHeight: window.height/3
       property int minHeight: window.height/3 * 2

       anchors.horizontalCenter: parent.horizontalCenter
       y: minHeight

       source: "images/face-smile.png"
   }
}
