import QtQuick 2.4
import QtQuick.Window 2.2


Window {
  id: rootWindow
  title: qsTr("hackathon-spb")
  width: 640
  height: 480
  visible: true

  Rectangle {
    id: root
    width:  rootWindow.width
    height: rootWindow.height
    x:0; y:0;
    color: "black"

    Rectangle {
      id: centerRect
      width: 100; height: 100
      x: (parent.width - width) / 2
      y: (parent.height - height) / 2
      color: "red"
    }

    states: [
      State { name: "" },
      State {
        name: "state2";
        PropertyChanges { target: centerRect; x: 0; y: 0 }
      }
    ]
    transitions: [
      Transition {
        from: ""; to: "state2"
        PropertyAnimation { target: centerRect
          easing.type: Easing.OutInBounce
          properties: "x"; duration: 1000 }
        PropertyAnimation { target: centerRect
          easing.type: Easing.OutInBounce
          properties: "y"; duration: 1000 }
      }
    ]
    Component.onCompleted: {
      state = "state2"
    }
  }
}
