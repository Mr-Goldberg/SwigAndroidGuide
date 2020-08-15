#include "Message.h"
#include "../../../../../../../../../home/alex/Android/Sdk/ndk-bundle/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/c++/v1/memory"

using namespace std;

namespace SwigAndroidGuide
{
    Message::Message(int id, const shared_ptr<string> text) : _id(id), text(text) {}

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
