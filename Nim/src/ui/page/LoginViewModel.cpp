#include "LoginViewModel.h"

#include <QObject>
#include <QDebug>
#include <QStringLiteral>

LoginViewModel::LoginViewModel(QObject *parent) : QObject(parent),
    m_model(NULL)
{}

LoginModel *LoginViewModel::model()
{
    return m_model;
}

void LoginViewModel::setModel(LoginModel *model)
{
    m_model = model;

    if (m_model)
    {
        connect(this, &LoginViewModel::nameChanged, m_model, &LoginModel::setName);
        connect(this, &LoginViewModel::passwordChanged, m_model, &LoginModel::setPassword);
    }
}

QString LoginViewModel::name()
{
    return m_name;
}

void LoginViewModel::setName(const QString &name)
{
    m_name = name;
    emit nameChanged(m_name);
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

QString LoginViewModel::state()
{
    return m_state;
}

void LoginViewModel::setState(const QString &state)
{
    m_state = state;
    emit stateChanged(state);
}

/**
 * @brief 点击登录
 */
void LoginViewModel::loginButtonClicked()
{
     qDebug() << QStringLiteral("点击了");
    if (m_model)
    {
        QString errorCode;
        if (!m_model->login(&errorCode))
        {
            setState("Failed:" + errorCode);
        }
        else
        {
            setState("Successed");
        }
    }
}
