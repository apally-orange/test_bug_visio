import 'dart:async';

import 'package:flutter/services.dart';

class TestBugVisio {
  static const MethodChannel _channel =
      const MethodChannel('test_bug_visio');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
