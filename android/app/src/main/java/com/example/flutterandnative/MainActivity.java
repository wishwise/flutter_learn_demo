package com.example.flutterandnative;


import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;


public class MainActivity extends FlutterActivity {
    private final String METHOD_CHANNEL = "flutter.native.communication";
    private MethodChannel methodChannel;
    private BinaryMessenger binaryMessenger;
    private EventChannel.EventSink eventsSender;
    @Override
    protected void onCreate(@Nullable  Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binaryMessenger = getFlutterEngine().getDartExecutor().getBinaryMessenger();
        methodChannel = new MethodChannel(binaryMessenger, METHOD_CHANNEL);

        //处理flutter传递来的消息，并返回某些消息
        methodChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(@NonNull  MethodCall call, @NonNull  MethodChannel.Result result) {
                System.out.println(call.method);
                if(call.method.equals("add")){
                    int n1 = call.argument("num1");
                    result.success(n1*2);
                    sendNativeMessage2Flutter();
                }
            }
        });

        new EventChannel(binaryMessenger,"native.flutter.event").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                eventsSender = events;
                eventsSender.success("消息通道准备完毕");
            }

            @Override
            public void onCancel(Object arguments) {

            }
        });
      
    }

    public void sendNativeMessage2Flutter(){
        Map map = new HashMap();
        map.put("1",2);
        eventsSender.success(map);
    }

}
