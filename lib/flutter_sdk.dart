import 'dart:async';

import 'package:flutter/services.dart';

class FlutterSdk {
  static const MethodChannel _channel = const MethodChannel('flutter_sdk');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<dynamic> showAleartDialog(String url) async {
    await _channel.invokeMethod('finicityConnectLite', {"url": url});
  }
}
