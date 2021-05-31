import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

ApplicationWindow  {

    id:root
    visible: true
    width: 1
    height: 1

    Component.onCompleted: {
        console.debug("App加载完成")
        close()
        Qt.createComponent("LoginActivity.qml").createObject(root).show()
    }

}
