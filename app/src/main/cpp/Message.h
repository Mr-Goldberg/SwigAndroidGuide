#pragma once

#include <memory>
#include <string>

namespace SwigAndroidGuide
{
    class Message
    {
    public:
        virtual ~Message() = default;

        int getId() { return _id; }

        void setId(int id) { _id = id; }

        std::shared_ptr<std::string> getText() { return _text; }

        void setText(std::shared_ptr<std::string> text) { _text = text; }

    private:

        int _id;
        std::shared_ptr<std::string> _text;
    };
}
