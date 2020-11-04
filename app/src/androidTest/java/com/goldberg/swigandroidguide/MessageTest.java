package com.goldberg.swigandroidguide;

import androidx.test.ext.junit.runners.AndroidJUnit4;

import com.goldberg.swigandroidguide.swiggenerated.Message;

import org.junit.Test;
import org.junit.runner.RunWith;

import static com.google.common.truth.Truth.assertThat;

@RunWith(AndroidJUnit4.class)
public class MessageTest
{
    static
    {
        // Load C++ library.
        // Alternatively it can be loaded in Application class,
        // as Android Application is created when executing Android tests.
        System.loadLibrary("native-lib");
    }

    @Test
    public void test()
    {
        Message message = new Message();
        message.setText(null);
        assertThat(message.getText()).isNull();
        message.setText("Have nice day");
        assertThat(message.getText()).isEqualTo("Have nice day");
    }
}
