/**
 * The SWIG 3.0 Java documentation (http://www.swig.org/Doc3.0/SWIGDocumentation.html#Java_adding_downcasts) suggests that this is the simplest way to support "downcasts" of SWIG generated classes that are part
 * of an inheritance relationship (altered to support shared_ptr's).
 *
 * Usage in swig:
 *   %dynamic_cast_extension(SwissClub, IJsonTransportMessage, ITransportMessage)
 *
 * Usage in java:
 *   void someFunction(ITransportMessage messageForTransport)
 *   {
 *       IJsonTransportMessage messageForTransportInJson = JsonTransportMessage.dynamic_cast(messageForTransport);
 *       if (messageForTransportInJson == null) return;
 *
 *       messageForTransportInJson.callRealDescendantMethod();
 *   }
 */
%define %dynamic_cast_extension(CppNamespace, DescendantClass, BaseClass)
%extend CppNamespace::DescendantClass
{
    static std::shared_ptr<CppNamespace::DescendantClass> dynamic_cast(std::shared_ptr<CppNamespace::BaseClass> arg)
    {
        return std::dynamic_pointer_cast<CppNamespace::DescendantClass>(arg);
    }
};
%enddef
