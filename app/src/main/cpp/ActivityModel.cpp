#include "ActivityModel.h"
#include <android/log.h>

namespace
{
    const char *const TAG = "ActivityModel";
}

namespace SwigAndroidGuide
{
    void ActivityModel::onCreate()
    {
        __android_log_print(ANDROID_LOG_DEBUG, TAG, "ActivityModel::onCreate()");
    }

    void ActivityModel::setMultiplier(int multiplier)
    {
        _multiplier = multiplier;
    }

    int ActivityModel::multiply(int a)
    {
        return _multiplier * a;
    }

    int ActivityModel::multiply(int a, int b)
    {
        return a * b;
    }
}
