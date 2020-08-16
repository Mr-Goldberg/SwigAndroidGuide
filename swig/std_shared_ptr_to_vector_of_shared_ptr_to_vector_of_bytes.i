%include <std_shared_ptr.i>
%include <std_vector.i>

namespace std
{
   // To properly recognize type defined in our Types.h
   %template(shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes) std::shared_ptr<std::vector<std::shared_ptr<std::vector<unsigned char>>>>;
}

// Use as Swig type alias
%define %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes std::shared_ptr<std::vector<std::shared_ptr<std::vector<unsigned char>>>> %enddef

%{
#include "Types.h"

namespace
{
	/*
	 * C++ type 'std::shared_ptr<std::vector<std::shared_ptr<std::vector<unsigned char>>>>' with alias 'shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes'
	 * is equivalent to Java type 'byte[][]',
	 * which is equivalent to JNI type: 'jobjectArray' with 'jbyteArray' elements.
	 * JNI descriptors are 'jobjectArray' = '[[B' (treat as byte[][]), 'jbyteArray' = '[B'.
	 * Note: more logical will be to pass two-dimensional array, but JNI does support only 1-dimentional arrays.
	 */

	shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes convertArrayOfArraysOfByteFromJavaToCpp(JNIEnv *jenv, jobjectArray javaArrayOfArraysOfBytes)
	{
		if(javaArrayOfArraysOfBytes == nullptr) return nullptr;
		
		// Create outer vector
		
		jsize sizeOfArrayOfArrays = jenv->GetArrayLength(javaArrayOfArraysOfBytes);
		std::shared_ptr<std::vector<shared_ptr_to_vector_of_bytes>> vectorOfVectorsOfBytes = std::make_shared<std::vector<shared_ptr_to_vector_of_bytes>>();
		vectorOfVectorsOfBytes->reserve((size_t) sizeOfArrayOfArrays);
		
		// Push all inner vectors into outer vector
		
		for(jsize i = 0; i < sizeOfArrayOfArrays; ++i)
		{
			// Null array
			
			jbyteArray arrayOfBytes = (jbyteArray) (jenv->GetObjectArrayElement(javaArrayOfArraysOfBytes, i));
			if (arrayOfBytes == nullptr)
			{
				vectorOfVectorsOfBytes->push_back(nullptr);
				continue;
			}

			// Empty array

			jsize sizeOfBuffer = jenv->GetArrayLength(arrayOfBytes);
			if(sizeOfBuffer == 0)
			{
				vectorOfVectorsOfBytes->push_back(std::make_shared<vector_of_bytes>());
				continue;
			}

			// Array with elements

			jbyte *bufferOfBytes = jenv->GetByteArrayElements(arrayOfBytes, nullptr);
			shared_ptr_to_vector_of_bytes vector = std::make_shared<vector_of_bytes>(bufferOfBytes, bufferOfBytes + sizeOfBuffer);
			vectorOfVectorsOfBytes->push_back(vector);
			jenv->ReleaseByteArrayElements(arrayOfBytes, bufferOfBytes, 0);
		}

		return vectorOfVectorsOfBytes;
	}
	
	jobjectArray convertArrayOfArraysOfByteFromCppToJava(JNIEnv *jenv, shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes vectorOfVectorsOfBytes)
	{
		if (!vectorOfVectorsOfBytes) return nullptr;

		// Allocate array of objects, where each object is 'jbyteArray'

		jsize sizeOfArrayOfArrays = (jsize) vectorOfVectorsOfBytes->size();
		jclass classOfJByteArray = jenv->FindClass("[B"); // '[B' is the JNI field descriptor for the Java byte[] type
		jobjectArray arrayOfArraysOfBytes = jenv->NewObjectArray(sizeOfArrayOfArrays, classOfJByteArray, nullptr);

		// Set inner arrays to it

		for(jsize i = 0; i < sizeOfArrayOfArrays; ++i)
		{
			// Null array
			
			shared_ptr_to_vector_of_bytes vectorOfBytes = vectorOfVectorsOfBytes->at(i);
			if (!vectorOfBytes)
			{
				continue;
			}
			
			// Empty array
			
			jsize sizeOfArray = (jsize) vectorOfBytes->size();
			jbyteArray javaArrayOfBytes = jenv->NewByteArray(sizeOfArray);
			jenv->SetObjectArrayElement(arrayOfArraysOfBytes, (jsize) i, javaArrayOfBytes);
			if (sizeOfArray == 0)
			{
				continue;
			}
			
			// Array with elements
			
			jenv->SetByteArrayRegion(javaArrayOfBytes, 0, sizeOfArray, (jbyte *) &(vectorOfBytes->at(0)));
		}

		return arrayOfArraysOfBytes;
	}
}
%}

%typemap(jstype) %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes "byte[][]"
%typemap(jtype) %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes "byte[][]"
%typemap(javain) %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes "$javainput"
%typemap(jni) %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes "jobjectArray"
%typemap(in) %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes
{
	$1 = convertArrayOfArraysOfByteFromJavaToCpp(jenv, $input);
}
%typemap(javadirectorout) %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes "$javacall"
%typemap(directorout) %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes
{
	$result = convertArrayOfArraysOfByteFromJavaToCpp(jenv, $input);
}
%typemap(argout) %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes;  // Just override the default and do nothing
%typemap(freearg) %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes; // Just override the default and do nothing
%typemap(javaout) %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes
{
     return $jnicall;
}
%typemap(out) %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes
{
	$result = convertArrayOfArraysOfByteFromCppToJava(jenv, $1);
}
%typemap(javadirectorin) %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes "$jniinput"
// '[[B' is the JNI field descriptor for the Java 'byte[][]' type
%typemap(directorin,descriptor="[[B") %shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes
{	
	$input = convertArrayOfArraysOfByteFromCppToJava(jenv, $1);
}
