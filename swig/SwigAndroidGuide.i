// Module name (required)

%module(directors="1") SwigAndroidGuide

// SWIG includes

%include <std_shared_ptr.i>
%include <std_string.i>
%include "std_function.i"
%include "dynamic_cast_extension.i"
%include "std_shared_ptr_to_string.i"
%include "std_shared_ptr_to_vector_of_bytes.i"
%include "std_shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes.i"

%std_function_void(FunctorVoid, void);
%dynamic_cast_extension(SwigAndroidGuide, PhotoMessage, Message)
%dynamic_cast_extension(SwigAndroidGuide, VideoMessage, Message)

// %{...%} In included into generated *.cpp file literally, without processing.
// Generated file is simple C++ file, so needed to include all required headers there too.

%{
#include "Types.h"
#include "ActivityModel.h"
#include "Message.h"
#include "PhotoMessage.h"
#include "VideoMessage.h"
#include "IAndroidActivity.h"
#include "ITaskScheduler.h"
%}

// Process our C++ file (only the public section)

%include "Types.h"

%include "ActivityModel.h"

%shared_ptr(SwigAndroidGuide::Message);
%include "Message.h"
%shared_ptr(SwigAndroidGuide::PhotoMessage);
%include "PhotoMessage.h"
%shared_ptr(SwigAndroidGuide::VideoMessage);
%include "VideoMessage.h"

%feature("director") IAndroidActivity;
%include "IAndroidActivity.h"

%feature("director") ITaskScheduler;
%include "ITaskScheduler.h"
