#include "Multiply.h"

namespace SwigAndroidGuide
{
    Multiply::Multiply(int multiplier)
    {
        _multiplier = multiplier;
    }

    int Multiply::multiply(int a)
    {
        return _multiplier * a;
    }

    int Multiply::multiply(int a, int b)
    {
        return a * b;
    }
}
