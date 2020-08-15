package com.goldberg.swigandroidguide;

import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.goldberg.swigandroidguide.swiggenerated.ActivityModel;

public class MainActivity extends AppCompatActivity
{
    private static final String TAG = MainActivity.class.getSimpleName();

    private final ActivityModel activityModel = new ActivityModel();

    static
    {
        System.loadLibrary("native-lib");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Example of a call to a native method
        TextView tv = findViewById(R.id.sample_text);
        tv.setText(stringFromJNI());

        // SWIG Examples

        activityModel.onCreate();
        mathExample();
    }

    private void mathExample()
    {
        Log.d(TAG, "mathExample() ActivityModel.multiply(5, 42): " + ActivityModel.multiply(5, 42));
        activityModel.setMultiplier(3);
        Log.d(TAG, "mathExample() activityModel.multiply(5): " + activityModel.multiply(6));
    }

    /**
     * A native method that is implemented by the 'native-lib' native library,
     * which is packaged with this application.
     */
    public native String stringFromJNI();
}
