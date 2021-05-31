#include "LoginViewModel.h"

#include <QObject>
#include <QDebug>
#include <QStringLiteral>

LoginViewModel::LoginViewModel(QObject *parent) : QObject(parent)
{}

void LoginViewModel::onCompleted(QObject* root){
    QMetaObject::invokeMethod(root,"startMainActivity");
    qDebug() << QStringLiteral("登录页面加载完成:")<<root->objectName();
}

QString LoginViewModel::username()
{
    return m_username;
}

void LoginViewModel::setUserName(const QString &username)
{
    m_username = username;
    emit nameChanged(username);
}

QString LoginViewModel::password()
{
    return m_password;
}

void LoginViewModel::setPassword(const QString &password)
{
    m_password = password;
    emit passwordChanged(m_password);
}

/**
 * @brief 点击登录
 */
void LoginViewModel::onClickLogin()
{
    qDebug() << "username:"<<username();
    qDebug() << "password:"<<password();
    //    close()
    //            Qt.createComponent("MainActivity.qml").createObject(root).show(
}
