// Module name (required)

%module SwigAndroidGuide

// %{...%} In included into generated *.cpp file literally, without processing.
// Generated file is simple C++ file, so needed to include all required headers there too.

%{
#include "ActivityModel.h"
%}

// Process our C++ file (only the public section)

%include "ActivityModel.h"
