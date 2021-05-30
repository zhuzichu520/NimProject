#ifndef LOGINVIEWMODEL_H
#define LOGINVIEWMODEL_H

#include <QObject>
#include "LoginModel.h"

class LoginViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(QString state READ state WRITE setState NOTIFY stateChanged)

public:
    explicit LoginViewModel(QObject *parent = 0);
    LoginModel* model();
    void setModel(LoginModel *model);
    QString name();
    void setName(const QString &name);
    QString password();
    void setPassword(const QString &password);
    QString state();
    void setState(const QString &state);
    Q_INVOKABLE void loginButtonClicked();
signals:
    void nameChanged(const QString &);
    void passwordChanged(const QString &);
    void stateChanged(const QString &);

private:
    QString m_name;
    QString m_password;
    QString m_state;

    LoginModel *m_model;
};
#endif // LOGINVIEWMODEL_H
