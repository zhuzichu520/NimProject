#ifndef APPNIM_H
#define APPNIM_H

#include <QtMvvmCore/CoreApp>

class NimApplication : public QtMvvm::CoreApp
{
    Q_OBJECT

public:
    NimApplication(QObject *parent = nullptr);

protected:
    void performRegistrations() override;
    int startApp(const QStringList &arguments) override;
};

#undef coreApp
#define coreApp static_cast<NimApplication*>(QtMvvm::CoreApp::instance())

#endif // SAMPLECOREAPP_H

