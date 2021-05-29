#include "NimApplication.h"

#include <QtCore/QLoggingCategory>
#include <QtCore/QCommandLineParser>
#include <QtMvvmCore/QtMvvmCoreVersion>
#include <ui/page/LoginViewModel.h>

NimApplication::NimApplication(QObject *parent) :
    CoreApp(parent)
{
    QCoreApplication::setApplicationName(QStringLiteral("nim"));
    QCoreApplication::setApplicationVersion(QStringLiteral(QTMVVMCORE_VERSION_STR));
    QCoreApplication::setOrganizationName(QStringLiteral("zhuzichu"));
}

void NimApplication::performRegistrations()
{
    Q_INIT_RESOURCE(qml);
    QLoggingCategory::setFilterRules(QStringLiteral("qtmvvm.debug=true"));
}

int NimApplication::startApp(const QStringList &arguments)
{
//    show<LoginViewModel>();
    return EXIT_SUCCESS;
}

