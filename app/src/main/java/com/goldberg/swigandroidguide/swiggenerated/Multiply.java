/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 4.0.1
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.goldberg.swigandroidguide.swiggenerated;

public class Multiply {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected Multiply(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(Multiply obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  @SuppressWarnings("deprecation")
  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        SwigAndroidGuideJNI.delete_Multiply(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public Multiply(int multiplier) {
    this(SwigAndroidGuideJNI.new_Multiply(multiplier), true);
  }

  public int multiply(int a) {
    return SwigAndroidGuideJNI.Multiply_multiply__SWIG_0(swigCPtr, this, a);
  }

  public static int multiply(int a, int b) {
    return SwigAndroidGuideJNI.Multiply_multiply__SWIG_1(a, b);
  }

}