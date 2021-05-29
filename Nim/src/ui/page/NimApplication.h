#ifndef APPNIM_H
#define APPNIM_H

#include <QtMvvmCore/CoreApp>

class NimApplication : public QtMvvm::CoreApp
{
    Q_OBJECT

    Q_PROPERTY(bool showDrawer READ showDrawer WRITE setShowDrawer NOTIFY showDrawerChanged)

public:
    NimApplication(QObject *parent = nullptr);

    bool showDrawer() const;

public Q_SLOTS:
    void setShowDrawer(bool showDrawer);

Q_SIGNALS:
    void showDrawerChanged(bool showDrawer);

protected:
    void performRegistrations() override;
    int startApp(const QStringList &arguments) override;

private:
    bool _showDrawer;
};

#undef coreApp
#define coreApp static_cast<NimApplication*>(QtMvvm::CoreApp::instance())

#endif // SAMPLECOREAPP_H

