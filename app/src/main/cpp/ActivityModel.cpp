#include "ActivityModel.h"
#include "IAndroidActivity.h"
#include "Message.h"

using namespace std;

namespace
{
    const char *const TAG = "ActivityModel";
}

namespace SwigAndroidGuide
{
    void ActivityModel::onCreate(IAndroidActivity *androidActivity)
    {
        androidActivity->showToast(make_shared<string>("Toast from C++"));
        androidActivity->sendMessage(make_shared<Message>(22, make_shared<string>("Greetings!")));
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
