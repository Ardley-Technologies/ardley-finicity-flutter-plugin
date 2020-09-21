import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:finicity_sdk/finicity_sdk.dart';

void main() {
  const MethodChannel channel = MethodChannel('finicity_sdk');

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
    FinicitySdk foo = FinicitySdk();
    expect(await foo.platformVersion(), '42');
  });
}
