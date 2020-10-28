#pragma once

#include <string>
#include <memory>
#include "Types.h"

namespace SwigAndroidGuide
{
    class Message;
    class PhotoMessage;
    class ITaskScheduler;

    class IAndroidActivity
    {
    public:
        // Required. Otherwise SWIG will issue warning.
        virtual ~IAndroidActivity() = default;

        virtual void showToast(std::string text) = 0;

        virtual void sendMessage(std::shared_ptr<Message> message) = 0;

        virtual ITaskScheduler *getTaskScheduler() = 0;
    };
}
