/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 4.0.1
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.goldberg.swigandroidguide.swiggenerated;

public class FunctorVoidImpl {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected FunctorVoidImpl(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(FunctorVoidImpl obj) {
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
        SwigAndroidGuideJNI.delete_FunctorVoidImpl(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  protected void swigDirectorDisconnect() {
    swigCMemOwn = false;
    delete();
  }

  public void swigReleaseOwnership() {
    swigCMemOwn = false;
    SwigAndroidGuideJNI.FunctorVoidImpl_change_ownership(this, swigCPtr, false);
  }

  public void swigTakeOwnership() {
    swigCMemOwn = true;
    SwigAndroidGuideJNI.FunctorVoidImpl_change_ownership(this, swigCPtr, true);
  }

  protected void call() {
    SwigAndroidGuideJNI.FunctorVoidImpl_call(swigCPtr, this);
  }

  public FunctorVoidImpl() {
    this(SwigAndroidGuideJNI.new_FunctorVoidImpl(), true);
    SwigAndroidGuideJNI.FunctorVoidImpl_director_connect(this, swigCPtr, true, true);
  }

}
