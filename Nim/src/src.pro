TEMPLATE = app

QT += core gui qml quick mvvmquick mvvmcore widgets quickcontrols2
include(./base/base.pri)
include(./http/http.pri)
include(./db/db.pri)
include(./entity/entity.pri)
include(./tools/tools.pri)
include(./ui/page/page.pri)
include(./ui/component/component.pri)

CONFIG += warning_clean exceptions c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
     main.cpp

RESOURCES += qml.qrc

#add lib dir to rpath
mac: QMAKE_LFLAGS += '-Wl,-rpath,\'$$OUT_PWD/../../../lib\''

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += targets
