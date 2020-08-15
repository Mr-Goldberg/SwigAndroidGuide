#pragma once

#include <string>

namespace SwigAndroidGuide
{
    class IAndroidActivity
    {
    public:
        // Required. Otherwise SWIG will issue warning.
        virtual ~IAndroidActivity() = default;

        virtual void showToast(std::string value) = 0;
    };
}
