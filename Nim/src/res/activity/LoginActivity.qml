import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

Window{

    width: 324
    height: 442
    visible: true
    color: "#00000000"
    flags:  Qt.FramelessWindowHint
    opacity: 1

    Rectangle {

        anchors.fill: parent
        color: "#00000000"

        Image {
            id: bg_login
            source: "qrc:/res/image/bg_login.png"
            anchors.fill: parent
        }

        Text{
            id:title
            text: "密信通"
            anchors{
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 141
            }
            font{
                pixelSize: 20
            }
        }

        Image {
            id: ic_key
            width: 36
            height: 36
            source: "qrc:/res/image/ic_login_key.png"
            anchors{
                top: parent.top
                left: parent.left
                topMargin: 204
                leftMargin: 45
            }
        }

        Image {
            id: ic_password
            width: 36
            height: 36
            source: "qrc:/res/image/ic_login_password.png"
            anchors{
                top:ic_key.bottom
                left: ic_key.left
                topMargin: 20
            }
        }

        Button {
            id: ic_close
            width: 20
            height: 20
            flat: true
            Image {
                anchors.fill: parent
                source: "qrc:/res/image/ic_toolbar_close.png"
            }
            anchors{
                top:parent.top
                right: parent.right
                topMargin: 30
                rightMargin: 30
            }
            onClicked: close()
        }

        Button {
            id: ic_min
            width: 20
            height: 20
            flat: true
            Image {
                anchors.fill: parent
                source: "qrc:/res/image/ic_toolbar_min.png"
            }
            anchors{
                top:ic_close.top
                right: ic_close.left
                rightMargin: 5
            }
             onClicked: hide()
        }
    }
}
