import 'package:flutter/material.dart';

abstract class FinicitySdkImpl {
  Future<String> platformVersion();
  Future<dynamic> showAlertDialog({String url, BuildContext context});
}
