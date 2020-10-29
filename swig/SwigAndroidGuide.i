// Module name (required)

%module(directors="1") SwigAndroidGuide

// Process our Types.h first, so SWIG will be able to understand our types.

%include "Types.h"

// SWIG includes

%include <std_shared_ptr.i>
%include <std_string.i>
%include <std_vector.i>
%include "std_function.i"
%include "dynamic_cast_extension.i"
%include "std_shared_ptr_to_string.i"
%include "std_shared_ptr_to_vector_of_bytes.i"
%include "std_shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes.i"
%include "time_t.i"

%template(VectorByte) std::vector<byte>;
%template(VectorVectorByte) std::vector<std::vector<byte>>;
	
%std_function_void(FunctorVoid, void);

%dynamic_cast_extension(SwigAndroidGuide, PhotoMessage, Message)

// %{...%} Is included into the generated *.cpp file literally, without processing.
// Generated file is simple C++ file, so needed to include all required headers there too.

%{
#include "Types.h"
#include "Message.h"
#include "PhotoMessage.h"
#include "ActivityModel.h"
#include "IAndroidActivity.h"
#include "ITaskScheduler.h"
%}

// Process our C++ file (only the public section of the classes)

%shared_ptr(SwigAndroidGuide::Message);
%include "Message.h"
%shared_ptr(SwigAndroidGuide::PhotoMessage);
%include "PhotoMessage.h"

%include "ActivityModel.h"

%feature("director") IAndroidActivity;
%include "IAndroidActivity.h"

%feature("director") ITaskScheduler;
%include "ITaskScheduler.h"
