#pragma once

namespace SwigAndroidGuide
{
    class ActivityModel
    {
    public:

        // Activity lifecycle

        void onCreate();

        // Math

        void setMultiplier(int multiplier);

        int multiply(int a);

        static int multiply(int a, int b);

    private:

        int _multiplier;
    };
}
