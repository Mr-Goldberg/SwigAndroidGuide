#pragma once

#include <string>
#include <memory>

namespace SwigAndroidGuide
{
    class IAndroidActivity
    {
    public:
        // Required. Otherwise SWIG will issue warning.
        virtual ~IAndroidActivity() = default;

        virtual void showToast(std::shared_ptr<std::string> text) = 0;
    };
}
