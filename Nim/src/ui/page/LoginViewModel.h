#ifndef LOGINVIEWMODEL_H
#define LOGINVIEWMODEL_H

#include <QtMvvmCore/ViewModel>
class LoginViewModel : public QtMvvm::ViewModel
{
    Q_OBJECT

    Q_PROPERTY(QString title READ title NOTIFY titleChanged)


public:
    Q_INVOKABLE explicit LoginViewModel(QObject *parent = nullptr);
    ~LoginViewModel();

    QString title() const;

Q_SIGNALS:
    void titleChanged(QString title);

protected:
    void onInit(const QVariantHash &params) override;

private:
    QString _title;

};

#endif // LOGINVIEWMODEL_H
