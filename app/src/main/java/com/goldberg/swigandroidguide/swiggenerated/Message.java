/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 4.0.1
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.goldberg.swigandroidguide.swiggenerated;

public class Message {
  private transient long swigCPtr;
  private transient boolean swigCMemOwn;

  protected Message(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(Message obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void swigSetCMemOwn(boolean own) {
    swigCMemOwn = own;
  }

  @SuppressWarnings("deprecation")
  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        SwigAndroidGuideJNI.delete_Message(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public int getId() {
    return SwigAndroidGuideJNI.Message_getId(swigCPtr, this);
  }

  public void setId(int id) {
    SwigAndroidGuideJNI.Message_setId(swigCPtr, this, id);
  }

  public java.lang.String getText() {
     return SwigAndroidGuideJNI.Message_getText(swigCPtr, this);
}

  public void setText(java.lang.String text) {
    SwigAndroidGuideJNI.Message_setText(swigCPtr, this, text);
  }

  public java.util.Date getCreationDate() {
	return new java.util.Date(SwigAndroidGuideJNI.Message_getCreationDate(swigCPtr, this) * 1000);
}

  public void setCreationDate(java.util.Date creationDate) {
    SwigAndroidGuideJNI.Message_setCreationDate(swigCPtr, this, creationDate.getTime() / 1000);
  }

  public Message() {
    this(SwigAndroidGuideJNI.new_Message(), true);
  }

}
