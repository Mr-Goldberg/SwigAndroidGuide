/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 4.0.1
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.goldberg.swigandroidguide.swiggenerated;

public class SwigAndroidGuideJNI {
  public final static native void ActivityModel_onCreate(long jarg1, ActivityModel jarg1_, long jarg2, IAndroidActivity jarg2_);
  public final static native void ActivityModel_setMultiplier(long jarg1, ActivityModel jarg1_, int jarg2);
  public final static native int ActivityModel_multiply__SWIG_0(long jarg1, ActivityModel jarg1_, int jarg2);
  public final static native int ActivityModel_multiply__SWIG_1(int jarg1, int jarg2);
  public final static native long new_ActivityModel();
  public final static native void delete_ActivityModel(long jarg1);
  public final static native void delete_IAndroidActivity(long jarg1);
  public final static native void IAndroidActivity_showToast(long jarg1, IAndroidActivity jarg1_, String jarg2);
  public final static native long new_IAndroidActivity();
  public final static native void IAndroidActivity_director_connect(IAndroidActivity obj, long cptr, boolean mem_own, boolean weak_global);
  public final static native void IAndroidActivity_change_ownership(IAndroidActivity obj, long cptr, boolean take_or_release);

  public static void SwigDirector_IAndroidActivity_showToast(IAndroidActivity jself, String value) {
    jself.showToast(value);
  }

  private final static native void swig_module_init();
  static {
    swig_module_init();
  }
}
