import 'package:flutter/material.dart';
import 'package:test_bug_visio/test_bug_visio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TestViewPlugin(),
        ),
      ),
    );
  }
}
