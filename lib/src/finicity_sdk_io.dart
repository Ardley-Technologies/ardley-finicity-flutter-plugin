import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'finicity_sdk_impl.dart';

class FinicitySdk implements FinicitySdkImpl {
  static const MethodChannel _channel = const MethodChannel('finicity_sdk');

  Future<String> platformVersion() async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<dynamic> showAlertDialog({String url, BuildContext context}) async {
    await _channel.invokeMethod('finicityConnectLite', {"url": url});
  }
}
