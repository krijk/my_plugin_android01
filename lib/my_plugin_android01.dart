
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

  Future<String?> getApiVersion() {
    return MyPluginAndroid01Platform.instance.getApiVersion();
  }

  Future<int?> getApiInt() {
    return MyPluginAndroid01Platform.instance.getApiInt();
  }
}
