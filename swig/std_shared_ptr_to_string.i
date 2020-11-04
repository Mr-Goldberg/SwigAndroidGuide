%include <std_shared_ptr.i>
%include <std_string.i>

%{
#include <memory>
#include <string>
%}

namespace std
{
	// To properly recognize type defined in our Types.h
	%template(shared_ptr_to_string) std::shared_ptr<std::string>;
}

%{
namespace
{
	std::shared_ptr<std::string> convertStringFromJavaToCpp(JNIEnv *jenv, jstring javaString)
	{
		if (!javaString) return nullptr;
		
		const char * psz_string = jenv->GetStringUTFChars(javaString, NULL);
		if (!psz_string)
		{
			return nullptr;
		}
		
		std::shared_ptr<std::string> cppString = std::make_shared<std::string>(psz_string);
		jenv->ReleaseStringUTFChars(javaString, psz_string);
		return cppString;
	}
	
	jstring convertStringFromCppToJava(JNIEnv *jenv, std::shared_ptr<std::string> cppString)
	{
		if (!cppString)
		{
			return nullptr;
		}

		return jenv->NewStringUTF(cppString->c_str());
	}
}
%}

//
// Type definitions for C type 'std::shared_ptr<std::string>'
//

%typemap(jstype) std::shared_ptr<std::string> "java.lang.String" // Java type
%typemap(jtype) std::shared_ptr<std::string> "java.lang.String" // Java intermediary type
%typemap(jni) std::shared_ptr<std::string> "jstring" // JNI C type (or intermediary C type)

//
// Java-side typemaps
//

// Conversion from 'jstype' (Java type) to 'jtype' (Java intermediary type)
%typemap(javain) std::shared_ptr<std::string> "$javainput"

// Conversion from 'jtype' (Java intermediary type) to 'jstype' (Java type)
%typemap(javaout) std::shared_ptr<std::string>
{
     return $jnicall;
}

// Conversion from 'jstype' (Java type) to 'jtype' (Java intermediary type) for director methods
%typemap(javadirectorout) std::shared_ptr<std::string> "$javacall"

// Conversion from 'jtype' (Java intermediary type) to 'jstype' (Java type) for director methods
%typemap(javadirectorin) std::shared_ptr<std::string> "$jniinput"

//
// C++ side typemaps
//

// Conversion from 'jni' (JNI C type) to C++ type
%typemap(in) std::shared_ptr<std::string>
{
	$1 = convertStringFromJavaToCpp(jenv, $input);
}

// Conversion from C++ type to 'jni' (JNI C type)
%typemap(out) std::shared_ptr<std::string>
{
	return convertStringFromCppToJava(jenv, $1);
}

// Conversion from 'jni' (JNI C type) to C++ type for director methods
%typemap(directorout) std::shared_ptr<std::string>
{
	$result = convertStringFromJavaToCpp(jenv, $input);
}

// Conversion from C++ type to 'jni' (JNI C type) for director methods
// Note: Ljava/lang/String; is the JNI field descriptor for the Java String type
%typemap(directorin,descriptor="Ljava/lang/String;") std::shared_ptr<std::string>
{
	$input = convertStringFromCppToJava(jenv, $1);
}
