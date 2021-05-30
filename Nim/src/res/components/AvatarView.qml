import QtQuick 2.9
import QtGraphicalEffects 1.0

Item {//一个圆形图片

    property alias source: avatar.source

    width: 54
    height: 54
    Image {
        id: avatar
        anchors.centerIn: parent
        smooth: true
        visible: false
    }
    Rectangle {
        id: mask
        width: parent.width
        height: parent.height
        radius: width/2
        visible: false
    }
    OpacityMask {
        anchors.fill: parent
        source: avatar
        maskSource: mask
    }
}
