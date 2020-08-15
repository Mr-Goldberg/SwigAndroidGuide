#pragma once

#include <memory>
#include <string>

namespace SwigAndroidGuide
{
    class Message
    {
    public:

        Message(int id, const std::shared_ptr<std::string> text);

        int getId();

        void setId(int id);

        std::shared_ptr<std::string> getText();

        void setText(const std::shared_ptr<std::string> text);

    private:

        int _id;
        std::shared_ptr<std::string> text;
    };
}
