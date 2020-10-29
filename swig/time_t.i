//
// Type definitions for C type 'time_t'
//

%typemap(jstype) time_t "java.util.Date" // Java type
%typemap(jtype) time_t "long" // Java intermediary type
%typemap(jni) time_t "jlong" // JNI C type (or intermediary C type)

//
// Java-side typemaps
//

// Conversion from 'jstype' (Java type) to 'jtype' (Java intermediary type)
%typemap(javain) time_t "$javainput.getTime() / 1000"

// Conversion from 'jtype' (Java intermediary type) to 'jstype' (Java type)
%typemap(javaout) time_t
{
	return new java.util.Date($jnicall * 1000);
}

// Conversion from 'jstype' (Java type) to 'jtype' (Java intermediary type) for director methods
%typemap(javadirectorin) time_t "new java.util.Date($jniinput * 1000)"

// Conversion from 'jtype' (Java intermediary type) to 'jstype' (Java type) for director methods
%typemap(javadirectorout) time_t "$javacall.getTime() / 1000"

//
// C++ side typemaps
// All the typemaps are just an assignments.
//

%typemap(in) time_t "$1 = $input;" // Conversion from 'jni' (JNI C type) to C++ type
%typemap(out) time_t "$result = $1;" // Conversion from C++ type to 'jni' (JNI C type)

// Conversion from 'jni' (JNI C type) to C++ type for director methods
%typemap(directorout) time_t "$result = $input;"

// Conversion from C++ type to 'jni' (JNI C type) for director methods
// Note: Ljava/lang/String; is the JNI field descriptor for the Java String type
%typemap(directorin, descriptor = "Ljava/util/Date;") time_t "$input = $1;"
