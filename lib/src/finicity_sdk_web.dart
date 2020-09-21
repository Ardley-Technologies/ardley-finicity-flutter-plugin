@JS()
library connect;

import 'package:js/js.dart';

import 'finicity_sdk_impl.dart';

@JS('finicityConnect.connectIFrame')
external void connectIFrame(String url, Object obj);

@JS()
@anonymous
class ConnectOptions {
  external String get overlay;
  external Function get success;
  external Function get cancel;
  external Function get error;
  external Function get loaded;
  external Function get route;

  external factory ConnectOptions({
    String overlay,
    Function success,
    Function cancel,
    Function error,
    Function loaded,
    Function route,
  });
}

class FinicitySdk implements FinicitySdkImpl {
  Future<String> platformVersion() {
    return Future.value("Web");
  }

  Future<dynamic> showAlertDialog({String url}) async {
    connectIFrame(
      url,
      ConnectOptions(
        overlay: 'rgba(255,255,255, 0)',
        success: allowInterop(() {
          print('success');
        }),
        cancel: allowInterop(() {
          print('cancel');
        }),
        error: allowInterop(() {
          print('success');
        }),
        loaded: allowInterop(() {
          print('loaded');
        }),
        route: allowInterop(() {
          print('route');
        }),
      ),
    );
  }
}
