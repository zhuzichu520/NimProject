#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtMvvmCore/ServiceRegistry>
#include <QtMvvmQuick/QuickPresenter>
#include <QtMvvmCore/ServiceRegistry>
#include <ui/page/LoginViewModel.h>
#include <QtQuickControls2/QQuickStyle>
#include <QtMvvmCore>

#include <ui/page/NimApplication.h>
#include <base/echoservice.h>
#include <base/ieventservice.h>
#include <base/quickeventservice.h>

QTMVVM_REGISTER_CORE_APP(NimApplication)

int main(int argc, char *argv[])
{
#ifdef QML_PATH
    qputenv("QML2_IMPORT_PATH", QML_PATH);
#endif
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    qDebug() << QQuickStyle::availableStyles() << QQuickStyle::name();
    QtMvvm::QuickPresenter::getInputViewFactory(); //Workaround for QTBUG-69963
    qmlRegisterUncreatableType<LoginViewModel>("de.skycoder42.QtMvvm.Sample", 1, 1, "LoginViewModel", QStringLiteral("ViewModels cannot be created"));
    QtMvvm::ServiceRegistry::instance()->registerObject<EchoService>();
    QtMvvm::ServiceRegistry::instance()->registerInterface<IEventService, QuickEventService>();
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
