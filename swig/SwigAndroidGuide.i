// Module name (required)

%module(directors="1") SwigAndroidGuide

// SWIG includes

%include <swiginterface.i>
%include <std_string.i>

// %{...%} In included into generated *.cpp file literally, without processing.
// Generated file is simple C++ file, so needed to include all required headers there too.

%{
#include "ActivityModel.h"
#include "IAndroidActivity.h"
%}

// Process our C++ file (only the public section)

%include "ActivityModel.h"
	
%feature("director") IAndroidActivity;
%include "IAndroidActivity.h"
