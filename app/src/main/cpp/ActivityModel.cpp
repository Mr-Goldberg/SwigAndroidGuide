#include "ActivityModel.h"
#include <android/log.h>
#include "IAndroidActivity.h"
#include "ITaskScheduler.h"
#include "Message.h"
#include "PhotoMessage.h"

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

        void sendPhotoMessage(IAndroidActivity *androidActivity)
        {
            shared_ptr<PhotoMessage> photoMessage = make_shared<PhotoMessage>();
            photoMessage->setId(27);
            photoMessage->setText(make_shared<string>("PhotoMessage!"));

            vector<byte> photoData;
            photoData.push_back((byte)78);
            photoData.push_back((byte)64);
            photoData.push_back((byte)35);
            photoMessage->setPhotoData(photoData);

            androidActivity->sendMessage(photoMessage);
        }
    }

    void ActivityModel::onCreate(IAndroidActivity *androidActivity)
    {
        androidActivity->showToast("Toast from C++");

        shared_ptr<Message> message = make_shared<Message>();
        message->setId(22);
        message->setText(make_shared<string>("Greetings!"));
        androidActivity->sendMessage(message);
        sendPhotoMessage(androidActivity);
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
