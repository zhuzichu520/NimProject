#include "LoginViewModel.h"
#include <QtCore/QDebug>

LoginViewModel::LoginViewModel(QObject *parent) :
    ViewModel(parent),
    _title(tr("No Title"))
{}

LoginViewModel::~LoginViewModel()
{
    qInfo(Q_FUNC_INFO);
}

QString LoginViewModel::title() const
{
    return _title;
}

void LoginViewModel::onInit(const QVariantHash &params)
{
    qDebug() << "打开文件日志失败";
    _title = params.value(QStringLiteral("title"), _title).toString();
    emit titleChanged(_title);
}
