#pragma once

#include <string>
#include <memory>
#include "Types.h"

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

        // Cryptography

        int decryptMessages(shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes messages);

    private:

        int _multiplier;
    };
}
