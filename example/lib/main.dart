import 'package:flutter/material.dart';

import 'info_android.dart';

GlobalKey<InfoAndroidState> _keyInfoAndroid = GlobalKey<InfoAndroidState>();

void main() {
  runApp(const MyApp());
}

///
class MyApp extends StatefulWidget {
  ///
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late InfoAndroid infoAndroid;

  @override
  void initState() {
    infoAndroid = InfoAndroid(
      key: _keyInfoAndroid,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncInit();
    });
    super.initState();
  }

  /// async init
  Future<void> _asyncInit() async {
    _keyInfoAndroid.currentState?.init();
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
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text('Running on:'),
              infoAndroid,
            ],
          ),
        ),
      ),
    );
  }
}
