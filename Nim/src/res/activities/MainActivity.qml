import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4 as S
import QtQuick.Layouts 1.3
import "../components"

Window{

    id:root
    width: 300
    height: 695
    visible: true
    flags:Qt.FramelessWindowHint
    color: "#fefefe"

    SwipeView{
        id:swip
        currentIndex: 0
        anchors{
            top:tab.bottom
            bottom: bottom.top
            left:parent.left
            right:parent.right
        }
        Item {
            ListView {
                id:list
                anchors.fill: parent
                model:10
                delegate: ItemDelegate{
                    height: 62
                    width: parent.width
                    background: CustomButton{
                        Image {
                            id:item_icon
                            source: "qrc:/res/images/ic_avatar.png"
                            width: 42
                            height: 42
                            anchors{
                                left:parent.left
                                leftMargin: 14
                                verticalCenter: parent.verticalCenter
                            }
                        }

                        Text {
                            id: item_name
                            text: qsTr("张三"+modelData+"号")
                            font.pixelSize: 14
                            anchors{
                                left: item_icon.right
                                leftMargin: 14
                                top: parent.top
                                topMargin: 13
                            }
                        }

                        Text {
                            id: item_msg
                            text: qsTr("您好，我是法外狂徒")
                            font.pixelSize: 12
                            color: "#7A191F24"
                            anchors{
                                left:item_name.left
                                bottom: parent.bottom
                                bottomMargin: 12
                            }
                        }

                        Text {
                            id: item_data
                            text: qsTr("14:21")
                            font.pixelSize: 12
                            color: "#7A191F24"

                            anchors{
                                right: parent.right
                                rightMargin: 14
                                verticalCenter: item_name.verticalCenter
                            }
                        }

                        Rectangle{
                            width: parent.width
                            height: 0.5
                            color: "#dddddd"
                            anchors.bottom: parent.bottom
                        }


                        onClicked: {
                            Qt.createComponent("MessageActivity.qml").createObject(root).show()
                        }

                    }
                }
            }
        }
        Text {
            text: qsTr("page2")
        }
        Text {
            text: qsTr("page3")
        }
    }

    Image {
        id: bg_main
        source: "qrc:/res/images/bg_main.png"
        anchors.top: parent.top
        width: parent.width
        height: 140
    }

    Image {
        id:avatar
        source: "qrc:/res/images/ic_avatar.png"
        width: 52
        height: 52
        anchors{
            left: parent.left
            top: parent.top
            topMargin: 44
            leftMargin: 12
        }
    }

    Text {
        id: name
        text: qsTr("张三")
        color: "#ffffff"
        font.pixelSize: 18
        anchors{
            verticalCenter: avatar.verticalCenter
            left: avatar.right
            leftMargin: 14
        }
    }

    Rectangle{
        color: "#3DFFFFFF"
        width: parent.width
        height: 32
        anchors{
            bottom: bg_main.bottom
        }


        Image {
            id: ic_search
            source: "qrc:/res/images/ic_search.png"
            width: 20
            height: 20
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 12
            }
        }

        TextField{
            height: 20
            anchors{
                left: ic_search.right
                leftMargin: 8
                right: parent.right
                rightMargin: 8
                verticalCenter: parent.verticalCenter
            }
            font{
                pixelSize: 14
            }
            focus: true
            maximumLength: 15
            padding: 0
            color: "#A3FFFFFF"
            placeholderText: "搜索联系人、群组、聊天记录"
            verticalAlignment: TextInput.AlignVCenter
            wrapMode: TextEdit.Wrap
            background: Rectangle{
                color:"#00000000"
            }
        }

    }


    TabBar{
        id:tab
        width: parent.width
        height: 40
        anchors{
            top:bg_main.bottom
        }
        currentIndex: swip.currentIndex
        Repeater{
            model: ["消息","联系人","工作群"]
            TabButton{
                id:control
                implicitHeight: 40
                background: Rectangle{
                    color: "#ffffff"
                    Text {
                        text: qsTr(modelData)
                        anchors.centerIn: parent
                        font.pixelSize: 15
                        font.weight: Font.Black
                        color: control.checked ? "#FF4F7DA4":"#FF9CA4AD"
                    }
                    Rectangle{
                        height: 2
                        width: parent.width
                        anchors.bottom: parent.bottom
                        visible: control.checked
                        color: "#FF4F7DA4"
                    }
                }
                onClicked: swip.currentIndex = index
            }
        }
    }




    Rectangle{
        id:bottom
        color: "#eeeeee"
        width: parent.width
        height: 52
        anchors{
            bottom: parent.bottom
        }


        Image {
            id: ic_setting
            source: "qrc:/res/images/ic_setting.png"
            width: 20
            height: 20
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 16
            }
        }

        Image {
            id: ic_team
            source: "qrc:/res/images/ic_team_group.png"
            width: 20
            height: 20
            anchors{
                verticalCenter: parent.verticalCenter
                left: ic_setting.right
                leftMargin: 33
            }
        }

        Image {
            id: ic_friend
            source: "qrc:/res/images/ic_add_friend.png"
            width: 20
            height: 20
            anchors{
                verticalCenter: parent.verticalCenter
                left: ic_team.right
                leftMargin: 16
            }
        }

        Image {
            id: ic_note
            source: "qrc:/res/images/ic_note.png"
            width: 20
            height: 20
            anchors{
                verticalCenter: parent.verticalCenter
                left: ic_friend.right
                leftMargin: 16
            }
        }
    }

    TopBar{
        color: "#00000000"
        title: "密信通"
        titleColor: "#ffffff"
    }


}
