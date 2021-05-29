#include <QtWidgets/QApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtMvvmCore/ServiceRegistry>
#include <QtMvvmQuick/QuickPresenter>
#include <QtQuickControls2/QQuickStyle>
#include <QtCore/QDebug>

#include <ui/page/LoginViewModel.h>
#include <ui/page/NimApplication.h>

QTMVVM_REGISTER_CORE_APP(NimApplication)

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    qDebug() << QQuickStyle::availableStyles() << QQuickStyle::name();

    QtMvvm::QuickPresenter::getInputViewFactory(); //Workaround for QTBUG-69963

    qmlRegisterUncreatableType<LoginViewModel>("de.skycoder42.QtMvvm.Sample", 1, 1, "LoginViewModel", QStringLiteral("ViewModels cannot be created"));

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
