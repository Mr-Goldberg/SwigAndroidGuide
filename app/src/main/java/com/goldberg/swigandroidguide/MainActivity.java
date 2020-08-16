package com.goldberg.swigandroidguide;

import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.goldberg.swigandroidguide.swiggenerated.ActivityModel;
import com.goldberg.swigandroidguide.swiggenerated.IAndroidActivity;
import com.goldberg.swigandroidguide.swiggenerated.ITaskScheduler;
import com.goldberg.swigandroidguide.swiggenerated.Message;

import java.util.Locale;

public class MainActivity extends AppCompatActivity
{
    private static final String TAG = MainActivity.class.getSimpleName();

    static
    {
        System.loadLibrary("native-lib");
    }

    private final ActivityModel activityModel = new ActivityModel();
    private final AndroidActivity androidActivity = new AndroidActivity();
    private final ITaskScheduler taskScheduler = new TaskScheduler();

    private class AndroidActivity extends IAndroidActivity
    {
        @Override
        public void showToast(String text)
        {
            Toast.makeText(MainActivity.this, text, Toast.LENGTH_SHORT).show();
        }

        @Override
        public void sendMessage(Message message)
        {
            Toast.makeText(MainActivity.this,
                    String.format(Locale.US, "Message sent: '%d %s'", message.getId(), message.getText()),
                    Toast.LENGTH_SHORT).show();
        }

        @Override
        public ITaskScheduler getTaskScheduler()
        {
            return taskScheduler;
        }
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

        activityModel.onCreate(androidActivity);
        mathExample();
        decrypt();
    }

    private void mathExample()
    {
        Log.d(TAG, "mathExample() ActivityModel.multiply(5, 42): " + ActivityModel.multiply(5, 42));
        activityModel.setMultiplier(3);
        Log.d(TAG, "mathExample() activityModel.multiply(5): " + activityModel.multiply(6));
    }

    private void decrypt()
    {
        byte[][] messages = new byte[5][];
        for (int i = 0; i < messages.length; ++i)
        {
            messages[i] = new byte[(i + 1) * 385];
        }

        int result = activityModel.decryptMessages(messages);
        Log.d(TAG, "decrypt() Message bytes decrypted: " + result);
    }

    /**
     * A native method that is implemented by the 'native-lib' native library,
     * which is packaged with this application.
     */
    public native String stringFromJNI();
}
