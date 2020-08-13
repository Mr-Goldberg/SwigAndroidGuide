package com.goldberg.swigandroidguide;

import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.goldberg.swigandroidguide.swiggenerated.Multiply;

public class MainActivity extends AppCompatActivity
{
    private static final String TAG = MainActivity.class.getSimpleName();

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

        simpleExample();
    }

    private void simpleExample()
    {
        Log.d(TAG, "simpleExample() Multiply.multiply(5, 42): " + Multiply.multiply(5, 42));
        Multiply multiply = new Multiply(3);
        Log.d(TAG, "simpleExample() multiply.multiply(5): " + multiply.multiply(6));
    }

    /**
     * A native method that is implemented by the 'native-lib' native library,
     * which is packaged with this application.
     */
    public native String stringFromJNI();
}
