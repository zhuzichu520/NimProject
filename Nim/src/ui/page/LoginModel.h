#ifndef LOGINMODEL_H
#define LOGINMODEL_H

#include <QObject>

class LoginModel : public QObject
{
    Q_OBJECT
public:
    explicit LoginModel(QObject *parent = 0);

    bool login(QString *error);

    QString name();
    void setName(const QString &name);

    QString password();
    void setPassword(const QString &password);

private:
    QString m_name;
    QString m_password;
};

#endif // LOGINMODEL_H
