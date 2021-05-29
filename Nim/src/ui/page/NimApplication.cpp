#include "NimApplication.h"

#include <QtCore/QLoggingCategory>
#include <QtCore/QCommandLineParser>
#include <QtMvvmCore/QtMvvmCoreVersion>
#include <base/ieventservice.h>
#include <ui/page/LoginViewModel.h>

NimApplication::NimApplication(QObject *parent) :
    CoreApp(parent),
    _showDrawer(false)
{
    QCoreApplication::setApplicationName(QStringLiteral("QtMvvmSample"));
    QCoreApplication::setApplicationVersion(QStringLiteral(QTMVVMCORE_VERSION_STR));
    QCoreApplication::setOrganizationName(QStringLiteral("Skycoder42"));
}

bool NimApplication::showDrawer() const
{
    return _showDrawer;
}

void NimApplication::setShowDrawer(bool showDrawer)
{
    if (_showDrawer == showDrawer)
        return;

    _showDrawer = showDrawer;
    emit showDrawerChanged(_showDrawer);
}

void NimApplication::performRegistrations()
{
    Q_INIT_RESOURCE(qml);
    QtMvvm::registerInterfaceConverter<IEventService>();
    QLoggingCategory::setFilterRules(QStringLiteral("qtmvvm.debug=true"));
}

int NimApplication::startApp(const QStringList &arguments)
{
    QCommandLineParser parser;
    parser.addVersionOption();
    parser.addHelpOption();
    if(!autoParse(parser, arguments))
        return EXIT_SUCCESS;
    QVariantHash args;
    show<LoginViewModel>(args);
    return EXIT_SUCCESS;
}

