#include <QGuiApplication>
#include <QtQml>
#include <QtQuickControls2/QQuickStyle>
#include <QtCore/QDebug>
#include <ui/page/LoginViewModel.h>


int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    qDebug() << QQuickStyle::availableStyles() << QQuickStyle::name();

    LoginViewModel loginViewModel;
    qmlRegisterUncreatableType<LoginViewModel>("com.hiwi.nim", 1, 1, "LoginViewModel", QStringLiteral("ViewModels cannot be created"));

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("viewModel",&loginViewModel);
    engine.load(QUrl(QStringLiteral("qrc:///res/activity/App.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
