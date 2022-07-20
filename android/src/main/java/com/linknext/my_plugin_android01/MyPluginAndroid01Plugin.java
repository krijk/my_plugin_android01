package com.linknext.my_plugin_android01;

import android.os.Build;

import androidx.annotation.NonNull;

import java.lang.reflect.Field;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** MyPluginAndroid01Plugin */
public class MyPluginAndroid01Plugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "my_plugin_android01");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }
    else if(call.method.equals("getReleaseVersion")){
      result.success(android.os.Build.VERSION.RELEASE);
    }
    else if(call.method.equals("getReleaseName")){
      result.success(getReleaseName());
    }
    else if(call.method.equals("getApiVersion")){
      result.success("" + android.os.Build.VERSION.SDK_INT);
    }
    else if(call.method.equals("getApiInt")){
      result.success(android.os.Build.VERSION.SDK_INT);
    }
    else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  String getReleaseName(){
    String releaseName = "";
    Field[] fields = Build.VERSION_CODES.class.getFields();
    for (Field field : fields) {
      String fieldName = field.getName();
      int fieldValue = -1;
      try {
        fieldValue = field.getInt(new Object());
      } catch (IllegalArgumentException | IllegalAccessException | NullPointerException e) {
        e.printStackTrace();
      }

      if (fieldValue == Build.VERSION.SDK_INT) {
        releaseName = fieldName;
      }
    }
    return releaseName;
  }

}
