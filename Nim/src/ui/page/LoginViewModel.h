#ifndef LOGINVIEWMODEL_H
#define LOGINVIEWMODEL_H

#include <QObject>
#include <QQuickWindow>
#include <base/BaseViewModel.h>

class LoginViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString username READ username WRITE setUserName NOTIFY nameChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)

public:
    explicit LoginViewModel(QObject *parent = 0);
    Q_INVOKABLE void onCompleted(QObject* root);
    Q_INVOKABLE void onClickLogin();
    QString username();
    QString password();
    void setUserName(const QString &username);
    void setPassword(const QString &password);

signals:
    void nameChanged(const QString &);
    void passwordChanged(const QString &);

    qmlsaaa:
    void startMainActivity();

private:
    QString m_username;
    QString m_password;
};
#endif // LOGINVIEWMODEL_H
