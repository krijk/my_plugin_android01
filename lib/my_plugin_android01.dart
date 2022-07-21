
import 'my_plugin_android01_platform_interface.dart';

/// Android plugin
class MyPluginAndroid01 {

  /// Get platform version in format 'AndroidXXX'
  Future<String?> getPlatformVersion() {
    return MyPluginAndroid01Platform.instance.getPlatformVersion();
  }

  /// Get release version
  Future<String?> getReleaseVersion() {
    return MyPluginAndroid01Platform.instance.getReleaseVersion();
  }

  /// Get release name
  Future<String?> getReleaseName() {
    return MyPluginAndroid01Platform.instance.getReleaseName();
  }

  /// Get API/SDK version in string
  Future<String?> getApiVersion() {
    return MyPluginAndroid01Platform.instance.getApiVersion();
  }

  /// Get API/SDK version in int
  Future<int?> getApiInt() {
    return MyPluginAndroid01Platform.instance.getApiInt();
  }
}
