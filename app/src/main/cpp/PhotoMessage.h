#pragma once

#include "Types.h"
#include "Message.h"

namespace SwigAndroidGuide
{
    class PhotoMessage : public Message
    {
    public:
        std::vector<byte> getPhotoData() { return _photoData; }

        void setPhotoData(std::vector<byte> photoData) { _photoData = photoData; }

    private:

        std::vector<byte> _photoData;
    };
}
