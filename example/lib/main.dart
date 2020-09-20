import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:finicity_sdk/finicity_sdk.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  FinicitySdk finicitySdk;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    finicitySdk = FinicitySdk();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FinicitySdk.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: FlatButton(
            onPressed: () {
              finicitySdk.showAlertDialog("https://connect.finicity.com?customerId=1012913783&institutionId=102176&partnerId=2445582806440&redirectUri=https%3A%2F%2Fwww.ardley.co&signature=841882b9bc7909f30bd310cb2881c3d40467dd055a5a568289929cf7633b33e3&timestamp=1600372172088&ttl=1600379372088&type=lite&webhook=https%3A%2F%2F9d29c311a9d3.ngrok.io%2Ffinicity%2Fwebhook%2Ff6813bd1-1267-4853-bbea-b9c6e03971fc%3FAuthorization%3DeyJraWQiOiJ2eHYwZUZUZkt5QW1EZUdNZit6SW9HTWJDWmRGWTlcLytLRHpPbVh1UlpLUT0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJmNjgxM2JkMS0xMjY3LTQ4NTMtYmJlYS1iOWM2ZTAzOTcxZmMiLCJldmVudF9pZCI6ImNiMGEyZjI1LTU3ZGYtNGRkMi05OTRjLWFkNjE2YzMyMmU0YSIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE2MDAzNjk5MjQsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC51cy1lYXN0LTEuYW1hem9uYXdzLmNvbVwvdXMtZWFzdC0xXzE2TlZMTkNkMyIsImV4cCI6MTYwMDM3MzUyNCwiaWF0IjoxNjAwMzY5OTI0LCJqdGkiOiIxMTA2ZjlkOS1iZWQ4LTRmNzktODljNy1jZWZmMzVhYTQ0ZjgiLCJjbGllbnRfaWQiOiI3ZzdrcmZxMnRjZjh1cHFvcDZ0NDZxcjMyYSIsInVzZXJuYW1lIjoicWI1Wm9sVDlYODAwR0dLV25CVXEifQ.fAH8uBWAxOuJji7CYcV2a_9ekR0evaGLw9aACY6hInzKKze8zqMAl7JlVVXh4bibDOeI7INiHotu-4WUPzo68U6h0FZo2EIYFOFsL5SJt9y7ZzoaWsx6KfNHXY0WTcQhhk4NW7oznP55RENnws0SmcMRhKXZQrbs9JnTr-WrELk3OJF128X3iUtoJriZrgcGUyHfCseczZMyCD1Li_R2KYFBOw7ZSwmnYPICF14zNpohq7UeBXRNDMH6dH6tivz0UO52sqGBzTo5BlPllSBI-cJhPvn3dez6Ejl-dDZU8azMMHgcNS_VjaPIE0nBUziNhcpfX3RPCTZ_41GMjJTLWA&webhookContentType=application%2Fjson");
            },
            child: Text(
              "Flat Button",
            ),
          ),
        ),
      ),
    );
  }
}
