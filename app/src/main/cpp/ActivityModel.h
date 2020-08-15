#pragma once

namespace SwigAndroidGuide
{
    class IAndroidActivity;

    class ActivityModel
    {
    public:

        // Activity lifecycle

        void onCreate(IAndroidActivity* androidActivity);

        // Math

        void setMultiplier(int multiplier);

        int multiply(int a);

        static int multiply(int a, int b);

    private:

        int _multiplier;
    };
}
