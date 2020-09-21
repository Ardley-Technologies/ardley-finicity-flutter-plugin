import 'dart:async';

import 'package:flutter/services.dart';

class FinicitySdk {
  static const MethodChannel _channel = const MethodChannel('finicity_sdk');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<dynamic> showAlertDialog(String url) async {
    return await _channel.invokeMethod('finicityConnectLite', {"url": url});
  }
}
