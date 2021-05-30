import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import "../components"

Window{

    id:root
    width: 625
    height: 552
    visible: true
    flags:Qt.FramelessWindowHint
    color: "#fefefe"

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        property point clickPos: "0,0"
        onPressed: {
            clickPos  = Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged: {
            //鼠标偏移量
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
            //如果mainwindow继承自QWidget,用setPos
            root.setX(root.x+delta.x)
            root.setY(root.y+delta.y)
        }
    }


    Rectangle{
        id:top
        color: "#FF176DDC"
        height: 40
        anchors{
            top:  parent.top
            left: parent.left
            right: parent.right
        }

        Image {
            id: bg_top
            width: 207
            height: 40
            source: "qrc:/res/images/bg_message_top.png"
            anchors{
                left: parent.left
            }
        }

        Image {
            id: ic_logo
            width: 25
            height: 25
            source: "qrc:/res/images/ic_message_logo.png"
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 12
            }
        }

        Button{
            id: ic_close
            width: 25
            height: 25
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 3
            }
            background:  Image {
                anchors.fill: parent
                source: "qrc:/res/images/ic_message_close.png"
            }
            onClicked: {
                root.close()
            }
        }

        Image {
            id: ic_max
            width: 25
            height: 25
            source: "qrc:/res/images/ic_message_max.png"
            anchors{
                verticalCenter: parent.verticalCenter
                right: ic_close.left
            }
        }

        Image {
            id: ic_min
            width: 25
            height: 25
            source: "qrc:/res/images/ic_message_min.png"
            anchors{
                verticalCenter: parent.verticalCenter
                right: ic_max.left
            }
        }


        Text {
            id: create_group
            text: qsTr("创建群")
            font.pixelSize: 12

            anchors{
                verticalCenter: parent.verticalCenter
                right: ic_min.left
                rightMargin: 24
            }
            color: "#FFFFFFFF"
        }

        Image {
            id: ic_group
            width: 25
            height: 25
            source: "qrc:/res/images/ic_message_group.png"
            anchors{
                verticalCenter: parent.verticalCenter
                right: create_group.left
            }
        }

        Text {
            id: title
            text: qsTr("张三")
            font.pixelSize: 18

            anchors{
                verticalCenter: parent.verticalCenter
                left: ic_logo.right
                leftMargin: 12
            }
            color: "#ffffff"
        }
    }

    Rectangle {
        id:content
        anchors{
            top:top.bottom
            bottom: bottom.top
            left:parent.left
            right:parent.right
        }
        color:"#FFF5F6F8"
    }

    Rectangle{
        id:bottom
        color:"#FFF5F6F8"
        width: parent.width
        height: 143
        anchors{
            bottom: parent.bottom
        }
        Item{
            id:bottom_menu
            width: parent.width
            height: 32
            Image {
                id: ic_font
                width: 20
                height: 20
                source: "qrc:/res/images/ic_message_bottom_font.png"
                anchors{
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 10
                }
            }
            Image {
                id: ic_face
                width: 20
                height: 20
                source: "qrc:/res/images/ic_message_bottom_face.png"
                anchors{
                    verticalCenter: parent.verticalCenter
                    left: ic_font.right
                    leftMargin: 15
                }
            }
            Image {
                id: ic_file
                width: 20
                height: 20
                source: "qrc:/res/images/ic_message_bottom_file.png"
                anchors{
                    verticalCenter: parent.verticalCenter
                    left: ic_face.right
                    leftMargin: 15
                }
            }

            Image {
                id: ic_capture
                width: 20
                height: 20
                source: "qrc:/res/images/ic_message_bottom_capture.png"
                anchors{
                    verticalCenter: parent.verticalCenter
                    left: ic_file.right
                    leftMargin: 15
                }
            }

            Text {
                id: history
                text: qsTr("历史消息")
                color:"#FF697686"
                font.pixelSize: 12
                anchors{
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 7
                }
            }

            Image {
                id: ic_history
                width: 20
                height: 20
                source: "qrc:/res/images/ic_message_bottom_history.png"
                anchors{
                    verticalCenter: parent.verticalCenter
                    right: history.left
                    leftMargin: 3
                }
            }
        }

        Rectangle{
            id:close
            width: 67
            height: 23
            radius: 3
            anchors{
                verticalCenter: send.verticalCenter
                right: send.left
                rightMargin: 7
            }
            border{
                width: 1
                color: "#FFD7D8DB"
            }
            Button{
                anchors.fill: parent
                background: Text {
                    text: qsTr("关闭")
                    anchors.centerIn: parent
                }
                onClicked: {
                    root.close()
                }
            }

        }

        Rectangle{
            id:send
            width: 67
            height: 23
            radius: 3
            anchors{
                bottom: parent.bottom
                bottomMargin: 7
                right: parent.right
                rightMargin: 7
            }
            Text {
                text: qsTr("发送")
                anchors.centerIn: parent
                color: "#ffffff"
            }
            color: "#FF197DFF"
        }


        ScrollView{
            focus: true
            anchors{
                top:bottom_menu.top
                bottom: send.top
                bottomMargin: 7
                topMargin: 25
                left: parent.left
                right: parent.right
            }
            TextArea{
                font{
                    pixelSize: 12
                }
                placeholderText:"请输入消息"
                focus: true
                wrapMode: TextEdit.Wrap
                background: Rectangle{
                    color:"#00000000"
                }
            }
        }



    }

    Rectangle{
        color:"#FFdddddd"
        width: parent.width
        height: 1
        anchors{
            bottom: bottom.top
        }
    }

}
