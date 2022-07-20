import 'package:flutter/services.dart';
import 'package:my_plugin_android01/my_plugin_android01.dart';

class InfoAndroid {
  final MyPluginAndroid01 _myPluginAndroid01Plugin = MyPluginAndroid01();

  static const String strUnknown = 'Unknown';
  static const String strFailed = 'Failed';

  String releaseVersion = strUnknown;
  String releaseName = strUnknown;
  String apiVersion = strUnknown;

  InfoAndroid() {
    init();
  }

  Future<void> init() async {
    await getReleaseVersion();
    await getReleaseName();
    await getApiVersion();
  }

  Future<void> getReleaseVersion() async {
    try {
      releaseVersion = await _myPluginAndroid01Plugin.getReleaseVersion() ?? strUnknown;
    } on PlatformException {
      releaseVersion = strFailed;
    }
  }

  Future<void> getReleaseName() async {
    try {
      releaseName = await _myPluginAndroid01Plugin.getReleaseName() ?? '';
    } on PlatformException {
      releaseName = strFailed;
    }
  }

  Future<void> getApiVersion() async {
    try {
      apiVersion = await _myPluginAndroid01Plugin.getAPIVersion() ?? strUnknown;
    } on PlatformException {
      apiVersion = strFailed;
    }
  }

  @override
  String toString() {
    return 'Android$releaseVersion API$apiVersion $releaseName';
  }
}
