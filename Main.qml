import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: main
    width: 640
    height: 480
    visible: true
    title: qsTr("Prevent Quit Test App")
    property bool allowQuit: false

    Connections {
        target: QT_VERSION_MAJOR >= 6 ? Application : Qt.application
        function onAboutToQuit() {
            console.log("Qt version " + QT_VERSION_MAJOR)
            console.log("Quitting");
        }
    }

    onClosing: (closeEvent) => {
        console.log("Preventing app from closing");
        closeEvent.accepted = allowQuit;
        quitDialog.visible = true;
    }

    RowLayout {
        anchors.fill: parent
        Label {
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            text: "This app demonstrates how to be notified of and control app quitting"
            wrapMode: Text.WordWrap
        }
    }

    Rectangle {
        id: quitDialog
        anchors.fill: parent
        z: 1
        visible: false
        color: main.color
        ColumnLayout {
            anchors.centerIn: parent
            Label { text: "Are you sure you want to quit?" }
            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                Button {
                    text: "Ok"
                    onClicked: {
                        main.allowQuit = true;
                        Qt.quit();
                    }
                }
                Button {
                    text: "Cancel"
                    onClicked: quitDialog.visible = false;
                }
            }
        }
    }
}
