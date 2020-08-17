#pragma once

#include "Types.h"
#include "Message.h"

namespace SwigAndroidGuide
{
    class PhotoMessage : public Message
    {
    public:
        PhotoMessage(int id, std::shared_ptr <std::string> text) : Message(id, text) {}

        std::shared_ptr <std::vector<byte>> getPhotoData()
        {
            return photoData;
        }

        void setPhotoData(std::shared_ptr <std::vector<byte>> photoData)
        {
            this->photoData = photoData;
        }

    private:

        std::shared_ptr<std::vector<byte>> photoData;
    };
}
