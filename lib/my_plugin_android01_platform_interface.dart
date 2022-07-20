import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_plugin_android01_method_channel.dart';

abstract class MyPluginAndroid01Platform extends PlatformInterface {
  /// Constructs a MyPluginAndroid01Platform.
  MyPluginAndroid01Platform() : super(token: _token);

  static final Object _token = Object();

  static MyPluginAndroid01Platform _instance = MethodChannelMyPluginAndroid01();

  /// The default instance of [MyPluginAndroid01Platform] to use.
  ///
  /// Defaults to [MethodChannelMyPluginAndroid01].
  static MyPluginAndroid01Platform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyPluginAndroid01Platform] when
  /// they register themselves.
  static set instance(MyPluginAndroid01Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getReleaseVersion() {
    throw UnimplementedError('releaseVersion() has not been implemented.');
  }

  Future<String?> getReleaseName() {
    throw UnimplementedError('releaseName() has not been implemented.');
  }

  Future<String?> getApiVersion() {
    throw UnimplementedError('apiVersion() has not been implemented.');
  }

  Future<int?> getApiInt() {
    throw UnimplementedError('apiInt() has not been implemented.');
  }
}
