#include <QObject>

#include "LoginModel.h"

LoginModel::LoginModel(QObject *parent) : QObject(parent)
{

}

bool LoginModel::login(QString *error)
{
    return true;
}

QString LoginModel::name(){
    return   m_name;
}

void LoginModel::setName(const QString &name)
{
    m_name=name;
}

QString LoginModel::password()
{
    return  m_password;
}

void LoginModel::setPassword(const QString &password)
{
    m_password = password;
}
