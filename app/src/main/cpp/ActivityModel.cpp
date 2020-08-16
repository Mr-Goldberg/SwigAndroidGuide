#include "ActivityModel.h"
#include <android/log.h>
#include "IAndroidActivity.h"
#include "ITaskScheduler.h"
#include "Message.h"

using namespace std;

namespace SwigAndroidGuide
{
    namespace
    {
        const char *const TAG = "ActivityModel";

        void doAsyncTasks(IAndroidActivity *androidActivity)
        {
            ITaskScheduler *taskScheduler = androidActivity->getTaskScheduler();
            __android_log_print(ANDROID_LOG_DEBUG, TAG, "Is main thread: %d", taskScheduler->isMainThread());
            taskScheduler->executeOnBackgroundThread(
                    [=]()
                    {
                        __android_log_print(ANDROID_LOG_DEBUG, TAG, "Is main thread: %d", taskScheduler->isMainThread());
                        taskScheduler->executeOnUIThread(
                                [=]()
                                {
                                    __android_log_print(ANDROID_LOG_DEBUG, TAG, "Is main thread: %d", taskScheduler->isMainThread());
                                });
                    });
        }
    }

    void ActivityModel::onCreate(IAndroidActivity *androidActivity)
    {
        androidActivity->showToast(make_shared<string>("Toast from C++"));
        androidActivity->sendMessage(make_shared<Message>(22, make_shared<string>("Greetings!")));
        doAsyncTasks(androidActivity);
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

    int ActivityModel::decryptMessages(shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes messages)
    {
        int bytesDecrypted = 0;
        for (int i = 0; i < messages->size(); ++i)
        {
            bytesDecrypted += messages->at(i)->size();
        }

        return bytesDecrypted;
    }
}
