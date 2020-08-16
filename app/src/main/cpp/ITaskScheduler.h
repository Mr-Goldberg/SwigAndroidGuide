#pragma once

#include <functional>

namespace SwigAndroidGuide
{
    class ITaskScheduler
    {
    public:
        virtual ~ITaskScheduler() = default;

        virtual bool isMainThread() = 0;

        virtual void executeOnBackgroundThread(std::function<void()> function) = 0;

        virtual void executeOnUIThread(std::function<void()> function) = 0;
    };
}
