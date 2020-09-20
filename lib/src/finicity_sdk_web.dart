import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'finicity_sdk_impl.dart';

class FinicitySdk implements FinicitySdkImpl {
  Future<String> platformVersion() {
    return Future.value("Web");
  }

  Future<dynamic> showAlertDialog({String url, BuildContext context}) async {
    print('web showAlertDialog');

    String fileContents = """
      <html>
          <head>
              <meta name="viweport" content="width=device-width, initial-scale=2">
              <script src="https://connect.finicity.com/assets/sdk/finicity-connect.min.js"></script>
          </head>
          <body>
              <script>
                var finicityConnectUrl = "$url";
                window.finicityConnect.connectIFrame(finicityConnectUrl, {
                    selector: '#connect-container',
                    overlay: 'rgba(255,255,255, 0)',
                    success: function(data) {
                      console.log('Yay! We got data', data);
                    },
                    cancel: function() {
                      console.log('The user cancelled the iframe');
                    },
                    error: function(err) {
                      console.error('Some runtime error was generated during Finicity Connect', err);
                    },
                    loaded: function() {
                      console.log('This gets called only once after the iframe has finished loading');
                    },
                    route: function(event) {
                      console.log('This is called as the user progresses through Connect');
                    }
                  });
                </script>
          </body>
      </html>
      """;
    // print(fileContents);

    /* attempt #1: use a webview
    Widget wwv = WebView(
      initialUrl: '',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        webViewController.loadUrl(
          Uri.dataFromString(
            fileContents,
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8'),
          ).toString(),
        );
      },
    );
    */

    // attempt #2: use an iframe
    Size size = MediaQuery.of(context).size;

    final html.IFrameElement _iframeElement = html.IFrameElement();
    _iframeElement.height = size.height.round().toString();
    _iframeElement.width = size.width.round().toString();
    _iframeElement.srcdoc = fileContents;
    _iframeElement.style.border = 'none';
    _iframeElement.style.backgroundColor = "#FFFFFF";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    Widget wif = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return wif;
      },
    );
  }
}
