#include "Message.h"

using namespace std;

namespace SwigAndroidGuide
{
    Message::Message(int id, shared_ptr<string> text) : _id(id), text(text) {}

    int Message::getId()
    {
        return _id;
    }

    void Message::setId(int id)
    {
        _id = id;
    }

    std::shared_ptr<string> Message::getText()
    {
        return text;
    }

    void Message::setText(const shared_ptr<string> text)
    {
        Message::text = text;
    }
}
