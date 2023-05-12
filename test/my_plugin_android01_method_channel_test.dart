import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_plugin_android01/my_plugin_android01_method_channel.dart';

void main() {
  final MethodChannelMyPluginAndroid01 platform = MethodChannelMyPluginAndroid01();
  const MethodChannel channel = MethodChannel('my_plugin_android01');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel,
        (MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });

  test('getAPIVersion', () async {
    expect(await platform.getApiVersion(), '42');
  });
}
