import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

Window {

    visible: false
    width: 600
    height: 600
    title: qsTr("Hello World")

    Rectangle{
        id: mainPage
        anchors.fill: parent
        Button{
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter:parent.horizontalCenter
            text: "登录"
            onClicked: {
                var compMainPage = Qt.createComponent("LoginActivity.qml")
                        .createObject(mainPage);
                compMainPage.show();
            }
        }
    }

}
