#pragma once

namespace SwigAndroidGuide
{
    class Multiply
    {
    public:
        Multiply(int multiplier);

        int multiply(int a);

        static int multiply(int a, int b);

    private:

        int _multiplier;
    };
}
