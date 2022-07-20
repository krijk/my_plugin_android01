
import 'my_plugin_android01_platform_interface.dart';

class MyPluginAndroid01 {
  Future<String?> getPlatformVersion() {
    return MyPluginAndroid01Platform.instance.getPlatformVersion();
  }

  Future<String?> getReleaseVersion() {
    return MyPluginAndroid01Platform.instance.getReleaseVersion();
  }

  Future<String?> getReleaseName() {
    return MyPluginAndroid01Platform.instance.getReleaseName();
  }

  Future<String?> getAPIVersion() {
    return MyPluginAndroid01Platform.instance.getAPIVersion();
  }
}
