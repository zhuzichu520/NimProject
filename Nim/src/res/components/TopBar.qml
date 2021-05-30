import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Rectangle {

    property string title : ""
    property color titleColor: "#333333"

    id: toolBar
    height: 36
    width: root.width
    anchors{
        left: root.left
        right:root.right
        top:root.top
    }
    color: "#eeeeee"

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

    Text {
        text: qsTr(title)
        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 5
        }
        font{
            pixelSize: 12
        }
        color: titleColor
    }

    Button {
        id: ic_close
        width: 20
        height: 20
        flat: true
        Image {
            anchors.fill: parent
            source: "qrc:/res/images/ic_toolbar_close.png"
        }
        anchors{
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 5
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
            source: "qrc:/res/images/ic_toolbar_min.png"
        }
        anchors{
            top:ic_close.top
            right: ic_close.left
            rightMargin: 5
        }
        onClicked: close()
    }

}
