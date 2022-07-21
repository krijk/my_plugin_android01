import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_plugin_android01/my_plugin_android01.dart';

const String _strUnknown = 'Unknown';
const String _strFailed = 'Failed';

/// Android Information
// ignore: must_be_immutable
class InfoAndroid extends StatefulWidget {
  /// Release version in numbers
  String releaseVersion = _strUnknown;

  /// Release version in strings
  String releaseName = '';

  /// API/SDK version in strings
  String apiVersion = _strUnknown;

  /// API/SDK version in numbers
  int apiInt = 0;

  ///
  InfoAndroid({Key? key}) : super(key: key);

  @override
  State<InfoAndroid> createState() => InfoAndroidState();
}

///
class InfoAndroidState extends State<InfoAndroid> {
  final MyPluginAndroid01 _myPluginAndroid01Plugin = MyPluginAndroid01();

  /// should be called from e.g. 'WidgetsBinding.instance.addPostFrameCallback'
  Future<void> init() async {
    await getReleaseVersion();
    await getReleaseName();
    await getApiVersion();
    await getApiInt();
    setState(() {});
  }

  ///
  Future<void> getReleaseVersion() async {
    String releaseVersion;
    try {
      releaseVersion = await _myPluginAndroid01Plugin.getReleaseVersion() ?? _strUnknown;
    } on PlatformException {
      releaseVersion = _strFailed;
    }
    widget.releaseVersion = releaseVersion;
  }

  ///
  Future<void> getReleaseName() async {
    String releaseName;
    try {
      releaseName = await _myPluginAndroid01Plugin.getReleaseName() ?? '';
    } on PlatformException {
      releaseName = _strFailed;
    }
    widget.releaseName = releaseName;
  }

  ///
  Future<void> getApiVersion() async {
    String apiVersion;
    try {
      final int? api = await getApiInt();
      if (api != null) {
        apiVersion = '$api';
      } else {
        apiVersion = _strUnknown;
      }
    } on PlatformException {
      apiVersion = _strFailed;
    }
    widget.apiVersion = apiVersion;
  }

  ///
  Future<int?> getApiInt() async {
    final int apiInt = await _myPluginAndroid01Plugin.getApiInt() ?? -1;
    widget.apiInt = apiInt;
    return apiInt;
  }

  ///
  String get info {
    return 'Android${widget.releaseVersion} API${widget.apiVersion} (${widget.releaseName}) : apiInt=${widget.apiInt}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(info);
  }
}
