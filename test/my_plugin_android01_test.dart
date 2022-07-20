import 'package:flutter_test/flutter_test.dart';
import 'package:my_plugin_android01/my_plugin_android01.dart';
import 'package:my_plugin_android01/my_plugin_android01_platform_interface.dart';
import 'package:my_plugin_android01/my_plugin_android01_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyPluginAndroid01Platform 
    with MockPlatformInterfaceMixin
    implements MyPluginAndroid01Platform {

  @override
  Future<String?> getPlatformVersion() => Future.value('Android 42');

  @override
  Future<String?> getReleaseVersion() {
    return Future.value('42');
  }

  @override
  Future<String?> getReleaseName() {
    return Future.value('TIRAMISU');
  }

  @override
  Future<String?> getAPIVersion() => Future.value('13');
}

void main() {
  final MyPluginAndroid01Platform initialPlatform = MyPluginAndroid01Platform.instance;

  test('$MethodChannelMyPluginAndroid01 is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyPluginAndroid01>());
  });

  test('getPlatformVersion', () async {
    MyPluginAndroid01 myPluginAndroid01Plugin = MyPluginAndroid01();
    MockMyPluginAndroid01Platform fakePlatform = MockMyPluginAndroid01Platform();
    MyPluginAndroid01Platform.instance = fakePlatform;

    expect(await myPluginAndroid01Plugin.getPlatformVersion(), 'Android 42');
  });

  test('getReleaseVersion', () async {
    MyPluginAndroid01 myPluginAndroid01Plugin = MyPluginAndroid01();
    MockMyPluginAndroid01Platform fakePlatform = MockMyPluginAndroid01Platform();
    MyPluginAndroid01Platform.instance = fakePlatform;

    expect(await myPluginAndroid01Plugin.getReleaseVersion(), '42');
  });

  test('getReleaseName', () async {
    MyPluginAndroid01 myPluginAndroid01Plugin = MyPluginAndroid01();
    MockMyPluginAndroid01Platform fakePlatform = MockMyPluginAndroid01Platform();
    MyPluginAndroid01Platform.instance = fakePlatform;

    expect(await myPluginAndroid01Plugin.getReleaseName(), 'TIRAMISU');
  });

  test('getAPIVersion', () async {
    MyPluginAndroid01 myPluginAndroid01Plugin = MyPluginAndroid01();
    MockMyPluginAndroid01Platform fakePlatform = MockMyPluginAndroid01Platform();
    MyPluginAndroid01Platform.instance = fakePlatform;

    expect(await myPluginAndroid01Plugin.getAPIVersion(), '13');
  });
}
