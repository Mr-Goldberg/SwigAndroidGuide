#include "ActivityModel.h"
#include "IAndroidActivity.h"

namespace
{
    const char *const TAG = "ActivityModel";
}

namespace SwigAndroidGuide
{
    void ActivityModel::onCreate(IAndroidActivity* androidActivity)
    {
        androidActivity->showToast("Toast from C++");
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
