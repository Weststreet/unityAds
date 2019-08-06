import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unityads/unityads.dart';

void main() {
  const MethodChannel channel = MethodChannel('unityads');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Unityads.platformVersion, '42');
  });
}
