import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import "../components"

Window{

    id:root
    width: 300
    height: 400
    visible: true
    flags:Qt.FramelessWindowHint
    color: "#fefefe"

    Rectangle {

        anchors.fill: parent
        radius: 8

        Image {
            id: bg_login
            source: "qrc:/res/images/bg_login.png"
            anchors.top: parent.top
            width: parent.width
            height: 82
        }

        Image{
            source: "qrc:/res/images/ic_avatar.png"
            width: 54
            height: 54
            anchors{
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 51
            }
            Component.onCompleted:{

            }
        }

        Text{
            id:title
            text: qsTr("密信通")
            anchors{
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 120
            }
            font{
                pixelSize: 16
                weight: Font.Black
            }
        }


        Rectangle{
            id:mask_key
            color: "#0D4F7DA4"
            radius: 3
            height: 34
            width: parent.width
            anchors{
                left: parent.left
                right: parent.right
                top:parent.top
                leftMargin: 20
                topMargin: 168
                rightMargin: 20
            }
        }

        Rectangle{
            id:mask_password
            color: "#0D4F7DA4"
            radius: 3
            height: 34
            width: mask_key.width
            anchors{
                left: mask_key.left
                right: mask_key.right
                top:mask_key.bottom
                topMargin: 12
            }
        }

        Image {
            id: ic_key
            width: 16
            height: 16
            source: "qrc:/res/images/ic_login_key.png"
            anchors{
                verticalCenter: mask_key.verticalCenter
                left: mask_key.left
                leftMargin: 12
            }
        }

        TextField{
            height: 20
            anchors{
                left: ic_key.right
                right: mask_key.right
                leftMargin: 12
                rightMargin: 12
                verticalCenter : mask_key.verticalCenter
            }
            font{
                pixelSize: 14
            }
            focus: true
            wrapMode: TextEdit.Wrap
            verticalAlignment: TextInput.AlignVCenter
            placeholderText:"请输入Ukey"
            color: "#FFFF7A00"
            placeholderTextColor: "#999F9F9F"
            padding: 0
            background: Rectangle{
                color:"#00000000"
            }
        }

        Image {
            id: ic_password
            width: 16
            height: 16
            source: "qrc:/res/images/ic_login_password.png"
            anchors{
                verticalCenter: mask_password.verticalCenter
                left: mask_password.left
                leftMargin: 12
            }
        }

        TextField{
            height: 20
            anchors{
                left: ic_password.right
                right: mask_password.right
                leftMargin: 12
                rightMargin: 12
                verticalCenter:mask_password.verticalCenter
            }
            font{
                pixelSize: 14
            }
            focus: true
            maximumLength: 15
            padding: 0
            verticalAlignment: TextInput.AlignVCenter
            echoMode: TextInput.Password
            color: "#FFFF7A00"
            placeholderTextColor: "#999F9F9F"
            placeholderText:"请输入PN码"
            background: Rectangle{
                color:"#00000000"
            }
            wrapMode: TextEdit.Wrap
        }

        CustomButton{
            width: mask_password.width
            height: 38
            text: qsTr("登录")
            backgroundDefaultColor: "#FF4F7DA4"
            anchors{
                top:mask_password.bottom
                horizontalCenter: mask_password.horizontalCenter
                topMargin: 36
            }
            onClicked: {
                close()
                Qt.createComponent("MainActivity.qml").createObject(root).show()
            }
        }

        Text {
            id: version
            text: qsTr("当前版本：V1.0.1")
            color: "#4D191F24"
            anchors{
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 5
            }
        }
    }

    TopBar{
        color: "#00000000"
    }

}
