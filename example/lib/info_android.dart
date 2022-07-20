import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_plugin_android01/my_plugin_android01.dart';

class InfoAndroid extends StatefulWidget {
  @override
  State<InfoAndroid> createState() => InfoAndroidState();
}

class InfoAndroidState extends State<InfoAndroid> {
  final MyPluginAndroid01 _myPluginAndroid01Plugin = MyPluginAndroid01();

  static const String strUnknown = 'Unknown';
  static const String strFailed = 'Failed';

  String releaseVersion = '';
  String releaseName = '';
  String apiVersion = '';

  InfoAndroidState() {
    init();
  }

  Future<void> init() async {
    await getReleaseVersion();
    await getReleaseName();
    await getApiVersion();
    setState(() {});
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

  String get info {
    return 'Android$releaseVersion API$apiVersion ($releaseName)';
  }

  @override
  Widget build(BuildContext context) {
    return Text(info);
  }
}
