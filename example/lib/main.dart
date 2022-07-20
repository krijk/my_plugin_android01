import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:my_plugin_android01/my_plugin_android01.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = '';
  String _releaseVersion = '';
  String _releaseName = '';
  String _apiVersion = '';
  final _myPluginAndroid01Plugin = MyPluginAndroid01();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _myPluginAndroid01Plugin.getPlatformVersion() ?? 'PlatformVersion: Unknown';
    } on PlatformException {
      platformVersion = 'PlatformVersion: Failed to get';
    }

    String releaseVersion;
    try {
      releaseVersion = await _myPluginAndroid01Plugin.getReleaseVersion() ?? 'ReleaseVersion: Unknown';
    } on PlatformException {
      releaseVersion = 'ReleaseVersion: Failed to get';
    }

    String releaseName;
    try {
      releaseName = await _myPluginAndroid01Plugin.getReleaseName() ?? 'releaseName: Unknown';
    } on PlatformException {
      releaseName = 'releaseName: Failed to get';
    }

    String apiVersion;
    try {
      apiVersion = await _myPluginAndroid01Plugin.getAPIVersion() ?? 'APIVersion: Unknown';
    } on PlatformException {
      apiVersion = 'SDKVersion: Failed to get';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _releaseVersion = releaseVersion;
      _releaseName = releaseName;
      _apiVersion = apiVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('myPluginAndroid01'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Running on:'),
              Text(_platformVersion),
              Text(_releaseVersion),
              Text(_releaseName),
              Text(_apiVersion),
            ],
          ),
        ),
      ),
    );
  }
}
