#ifndef TOOLOBJECT_H
#define TOOLOBJECT_H

#include <QString>

/**
 * @brief 对象工具类
 */
class ToolDate
{
public:

    ToolDate();

    /**
     * @brief 获取当前时间字符串hh:mm:ss.zzz
     * @return 时间字符串
     */
    static QString getCurrTimeStr();

    /**
     * @brief 按格式返回当前日期字符串 默认：yyyy-MM-dd hh:mm:ss
     * @param formatStr 指定格式
     * @return
     */
    static QString getCurrDateTimeStr(QString formatStr = "yyyy-MM-dd hh:mm:ss");

};

#endif // TOOLOBJECT_H
