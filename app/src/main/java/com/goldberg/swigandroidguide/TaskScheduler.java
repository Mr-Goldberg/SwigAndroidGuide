package com.goldberg.swigandroidguide;

import android.os.Handler;
import android.os.Looper;

import com.goldberg.swigandroidguide.swiggenerated.FunctorVoid;
import com.goldberg.swigandroidguide.swiggenerated.ITaskScheduler;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

final class TaskScheduler extends ITaskScheduler
{
    private static final Handler mainThreadHandler = new Handler();
    private static final ExecutorService backgroundTaskExecutor = Executors.newSingleThreadExecutor();

    @Override
    public boolean isMainThread()
    {
        return Looper.getMainLooper().getThread() == Thread.currentThread();
    }

    @Override
    public void executeOnBackgroundThread(FunctorVoid function)
    {
        backgroundTaskExecutor.execute(function::call);
    }

    @Override
    public void executeOnUIThread(FunctorVoid function)
    {
        mainThreadHandler.post(function::call);
    }
}
