import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_bug_visio/test_bug_visio.dart';

void main() {
  const MethodChannel channel = MethodChannel('test_bug_visio');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await TestBugVisio.platformVersion, '42');
  });
}
