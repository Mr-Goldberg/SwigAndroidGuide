// Module name (required)

%module(directors="1") SwigAndroidGuide

// SWIG includes

%include <std_shared_ptr.i>
%include <std_string.i>
%include "std_shared_ptr_to_string.i"
%include "std_shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes.i"

// %{...%} In included into generated *.cpp file literally, without processing.
// Generated file is simple C++ file, so needed to include all required headers there too.

%{
#include "Types.h"
#include "ActivityModel.h"
#include "Message.h"
#include "IAndroidActivity.h"
%}

// Process our C++ file (only the public section)

%include "Types.h"

%include "ActivityModel.h"

%shared_ptr(SwigAndroidGuide::Message);
%include "Message.h"

%feature("director") IAndroidActivity;
%include "IAndroidActivity.h"
