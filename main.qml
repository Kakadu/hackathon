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
      },
      State {
        name: "state3";
        PropertyChanges { target: logo1; opacity: 1.0 }
        PropertyChanges { target: logo2; opacity: 1.0 }
        PropertyChanges { target: logo3; opacity: 1.0 }
      }
    ]
    transitions: [
      Transition {
        from: ""; to: "state2"
        PropertyAnimation { target: centerRect
          properties: "x"; duration: 1000 }
        PropertyAnimation { target: centerRect
          properties: "y"; duration: 1000
        }
        onRunningChanged: {
          if (root.state === "state2" && running === false) {
            root.state = "state3";
          }
        }
      },
      Transition {
        from: "state2";  to: "state3"
      }
    ]
    Component.onCompleted: {
      state = "state2"
    }
  }

  Logo {
    id: logo1
    source: "https://ocaml.org/img/OCaml_Sticker.svg"
    width: 100; height: 100; opacity: 0;
    anchors.right: parent.right
    anchors.top: parent.top
  }
  Logo {
    id: logo2
    source: "https://ocaml.org/img/OCaml_Sticker.svg"
    width: 100;    height: 100; opacity: 0;
    anchors.right: parent.right
    anchors.top: logo1.bottom
    anchors.topMargin: 20
  }
  Logo {
    id: logo3
    source: "https://ocaml.org/img/OCaml_Sticker.svg"
    width: 100;    height: 100; opacity: 0;
    anchors.right: parent.right
    anchors.top: logo2.bottom
    anchors.topMargin: 20
  }
}
