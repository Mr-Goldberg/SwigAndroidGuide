#!/bin/bash

# cd to directory of this script.
# Note: don't need to go back - by exit this script, terminal will remain in the directory it currently is.

cd "$(dirname "$0")"

# Define various files and directories for script to work with.

generated_src_base_dir="../app/src/main"
generated_cpp_dir="${generated_src_base_dir}/cpp/swig-generated"
android_src_dir="${generated_src_base_dir}/cpp"

# Generated C++/JNI code goes into this file.
# This file is included into 'CMakeLists.txt'
generated_cpp_file="${generated_cpp_dir}/SwigAndroidGuide_wrap.cpp"

# Generated Java code goes into this directory.
# This directory is included in app 'build.gradle', in block 'sourceSets {}'
generated_java_dir="${generated_src_base_dir}/java/com/goldberg/swigandroidguide/swiggenerated"

# Swig required already existing output directories.
# Delete all existing generated code and re-create directories.

rm -rf ${generated_cpp_dir}
rm -rf ${generated_java_dir}

mkdir -p ${generated_cpp_dir}
mkdir -p ${generated_java_dir}

# Run 'swig' tool.
#
# '-I' = include directory.
# '-c++ -java' - languages to create interface.
# '-package' defines Java package for generated code 'com.goldberg.swigandroidguide.swiggenerated'.
# '-o' - location of generated C++/JNI file.
# '-outdir' - location of generated Java code directory.
# 'SaveAndSpend.i' - script input file.
swig -I${android_src_dir} -I../../SharedSrc -c++ -java -package com.goldberg.swigandroidguide.swiggenerated -o ${generated_cpp_file} -outdir ${generated_java_dir} SwigAndroidGuide.i
