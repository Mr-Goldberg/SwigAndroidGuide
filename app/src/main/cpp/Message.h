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

        time_t getCreationDate() const { return _creationDate; }

        void setCreationDate(time_t creationDate) { _creationDate = creationDate; }

    private:

        int _id;
        std::shared_ptr<std::string> _text;
        time_t _creationDate;
    };
}
