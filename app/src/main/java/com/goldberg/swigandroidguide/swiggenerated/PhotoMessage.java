/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 4.0.1
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.goldberg.swigandroidguide.swiggenerated;

public class PhotoMessage extends Message {
  private transient long swigCPtr;
  private transient boolean swigCMemOwnDerived;

  protected PhotoMessage(long cPtr, boolean cMemoryOwn) {
    super(SwigAndroidGuideJNI.PhotoMessage_SWIGSmartPtrUpcast(cPtr), true);
    swigCMemOwnDerived = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(PhotoMessage obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void swigSetCMemOwn(boolean own) {
    swigCMemOwnDerived = own;
    super.swigSetCMemOwn(own);
  }

  @SuppressWarnings("deprecation")
  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwnDerived) {
        swigCMemOwnDerived = false;
        SwigAndroidGuideJNI.delete_PhotoMessage(swigCPtr);
      }
      swigCPtr = 0;
    }
    super.delete();
  }

  public PhotoMessage(int id, java.lang.String text) {
    this(SwigAndroidGuideJNI.new_PhotoMessage(id, text), true);
  }

  public byte[] getPhotoData() {
     return SwigAndroidGuideJNI.PhotoMessage_getPhotoData(swigCPtr, this);
}

  public void setPhotoData(byte[] photoData) {
    SwigAndroidGuideJNI.PhotoMessage_setPhotoData(swigCPtr, this, photoData);
  }

  public static PhotoMessage dynamic_cast(Message arg) {
    long cPtr = SwigAndroidGuideJNI.PhotoMessage_dynamic_cast(Message.getCPtr(arg), arg);
    return (cPtr == 0) ? null : new PhotoMessage(cPtr, true);
  }

}