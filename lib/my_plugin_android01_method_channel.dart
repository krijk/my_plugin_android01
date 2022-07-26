import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_plugin_android01_platform_interface.dart';

/// An implementation of [MyPluginAndroid01Platform] that uses method channels.
class MethodChannelMyPluginAndroid01 extends MyPluginAndroid01Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel = const MethodChannel('my_plugin_android01');

  @override
  Future<String?> getPlatformVersion() async {
    final String? version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getReleaseVersion() async {
    final String? version = await methodChannel.invokeMethod<String>('getReleaseVersion');
    return version;
  }

  @override
  Future<String?> getReleaseName() async {
    final String? version = await methodChannel.invokeMethod<String>('getReleaseName');
    return version;
  }

  @override
  Future<String?> getApiVersion() async {
    final String? version = await methodChannel.invokeMethod<String>('getApiVersion');
    return version;
  }

  @override
  Future<int?> getApiInt() async {
    final int? version = await methodChannel.invokeMethod<int>('getApiInt');
    return version;
  }
}
