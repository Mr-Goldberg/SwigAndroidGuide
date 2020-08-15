%include <std_shared_ptr.i>
%include <std_string.i>

%{
#include <memory>
#include <string>
%}

namespace std
{
   %template(shared_ptr_to_string) std::shared_ptr<std::string>;
}

%typemap(jstype) std::shared_ptr<std::string> "java.lang.String"
%typemap(jtype) std::shared_ptr<std::string> "java.lang.String"
%typemap(javain) std::shared_ptr<std::string> "$javainput"
%typemap(jni) std::shared_ptr<std::string> "jstring"
%typemap(in) std::shared_ptr<std::string>
{
    //actual JNI call:
    //const char *psz_string = jenv->GetStringUTFChars($input, NULL);

    const char *psz_string = JCALL2(GetStringUTFChars, jenv, $input, NULL);
    if (!psz_string)
    {
        $1 = nullptr;
    }
    else
    {
        $1 = std::make_shared<std::string>(psz_string);

        //psz_string needs to be released using jenv->ReleaseStringUTFChars($input, psz_string);
        JCALL2(ReleaseStringUTFChars, jenv, $input, psz_string);
    }
}
%typemap(javadirectorout) std::shared_ptr<std::string> "$javacall"
%typemap(directorout) std::shared_ptr<std::string>
{
    const char *psz_string = JCALL2(GetStringUTFChars, jenv, $input, NULL);
    if (!psz_string)
    {
        $result = nullptr;
    }
    else
    {
        $result = std::make_shared<std::string>(psz_string);

        JCALL2(ReleaseStringUTFChars, jenv, $input, psz_string);
    }
}
%typemap(argout) std::shared_ptr<std::string>;  //just override the default and do nothing
%typemap(freearg) std::shared_ptr<std::string>; //just override the default and do nothing
%typemap(javaout) std::shared_ptr<std::string>
{
     return $jnicall;
}
%typemap(out) std::shared_ptr<std::string>
{
    if (!$1)
    {
        return nullptr;
    }

    //actual JNI call:
    //return jenv->NewStringUTF(($1)->c_str());

    return JCALL1(NewStringUTF, jenv, ($1)->c_str());
}
%typemap(javadirectorin) std::shared_ptr<std::string> "$jniinput"
//Note: Ljava/lang/String; is the JNI field descriptor for the Java String type
%typemap(directorin,descriptor="Ljava/lang/String;") std::shared_ptr<std::string>
{
    if (!$1)
    {
        $input = nullptr;
    }
    else
    {
        $input = JCALL1(NewStringUTF, jenv, ($1)->c_str());
    }
}
