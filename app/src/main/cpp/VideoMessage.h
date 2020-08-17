#pragma once

#include "Types.h"
#include "Message.h"

namespace SwigAndroidGuide
{
    class VideoMessage : public Message
    {
    public:
        VideoMessage(int id, std::shared_ptr<std::string> text) : Message(id, text) {}

        shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes getVideoChunks()
        {
            return videoChunks;
        }

        void setVideoChunks(shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes videoChunks)
        {
            this->videoChunks = videoChunks;
        }

    private:
        shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes videoChunks;
    };
}
