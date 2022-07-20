import 'package:flutter/material.dart';

import 'info_android.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late InfoAndroid infoAndroid;

  @override
  void initState() {
    infoAndroid = InfoAndroid();
    super.initState();
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
              Text(infoAndroid.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
