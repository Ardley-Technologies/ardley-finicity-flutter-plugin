import 'package:flutter/material.dart';

import 'finicity_sdk_impl.dart';

class FinicitySdk implements FinicitySdkImpl {
  @override
  Future<String> platformVersion() {
    throw UnimplementedError();
  }

  @override
  Future showAlertDialog({String url, BuildContext context}) {
    throw UnimplementedError();
  }
}
