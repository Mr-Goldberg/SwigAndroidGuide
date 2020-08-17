%include <std_shared_ptr.i>
%include <std_vector.i>

%{
#include <memory>
#include <vector>
%}

%{
namespace
{
	std::shared_ptr<std::vector<unsigned char>> convertArrayOfBytesFromJavaToCpp(JNIEnv *jenv, jbyteArray javaArrayOfBytes)
	{
		if (!javaArrayOfBytes) return nullptr;
		
		jbyte *p_buffer = jenv->GetByteArrayElements(javaArrayOfBytes, nullptr);
		if (!p_buffer) return nullptr;
		
		jsize lengthOfBuffer = jenv->GetArrayLength(javaArrayOfBytes);
		std::shared_ptr<std::vector<unsigned char>> result;
		if (lengthOfBuffer != 0)
		{
			result = std::make_shared<std::vector<unsigned char>>(p_buffer, p_buffer + lengthOfBuffer);
		}
		else
		{
			result = std::make_shared<std::vector<unsigned char>>();
		}
		
		jenv->ReleaseByteArrayElements(javaArrayOfBytes, p_buffer, 0);
		return result;
	}
	
	jbyteArray convertArrayOfBytesFromCppToJava(JNIEnv *jenv, std::shared_ptr<std::vector<unsigned char>> vectorOfBytes)
	{
		if (!vectorOfBytes) return nullptr;

		jbyteArray javaArrayOfByte = jenv->NewByteArray(vectorOfBytes->size());
		if (!javaArrayOfByte) return nullptr;
		
		if (vectorOfBytes->size() != 0)
		{
			jenv->SetByteArrayRegion(javaArrayOfByte, 0, vectorOfBytes->size(), (jbyte *) &vectorOfBytes->at(0));
		}
		
		return javaArrayOfByte;
	}
}
%}

%typemap(jstype) std::shared_ptr<std::vector<unsigned char>> "byte[]"
%typemap(jtype) std::shared_ptr<std::vector<unsigned char>> "byte[]"
%typemap(javain) std::shared_ptr<std::vector<unsigned char>> "$javainput"
%typemap(jni) std::shared_ptr<std::vector<unsigned char>> "jbyteArray"
%typemap(in) std::shared_ptr<std::vector<unsigned char>>
{
	$1 = convertArrayOfBytesFromJavaToCpp(jenv, $input);
}
%typemap(javadirectorout) std::shared_ptr<std::vector<unsigned char>> "$javacall"
%typemap(directorout) std::shared_ptr<std::vector<unsigned char>>
{
	$result = convertArrayOfBytesFromJavaToCpp(jenv, $input);
}
%typemap(argout) std::shared_ptr<std::vector<unsigned char>>;  //just override the default and do nothing
%typemap(freearg) std::shared_ptr<std::vector<unsigned char>>; //just override the default and do nothing
%typemap(javaout) std::shared_ptr<std::vector<unsigned char>>
{
     return $jnicall;
}
%typemap(out) std::shared_ptr<std::vector<unsigned char>>
{
	$result = convertArrayOfBytesFromCppToJava(jenv, $1);
}
%typemap(javadirectorin) std::shared_ptr<std::vector<unsigned char>> "$jniinput"
//Note: [B is the JNI field descriptor for the Java byte[] type
%typemap(directorin,descriptor="[B") std::shared_ptr<std::vector<unsigned char>>
{
	$input = convertArrayOfBytesFromCppToJava(jenv, $1);
}
