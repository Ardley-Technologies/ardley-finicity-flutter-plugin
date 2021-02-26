import 'dart:async';

import 'package:finicity_sdk/finicity_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    finicitySdk = FinicitySdk();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await finicitySdk.platformVersion();
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
      home: HomePage(
        platformVersion: _platformVersion,
        finicitySdk: finicitySdk,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String platformVersion;
  final FinicitySdk finicitySdk;

  HomePage({
    this.platformVersion,
    this.finicitySdk,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finicity Connect Example App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                finicitySdk
                    .showAlertDialog(
                  url:
                      "https://connect.finicity.com?customerId=1012913783&institutionId=102176&partnerId=2445582806440&redirectUri=https%3A%2F%2Fwww.ardley.co&signature=27bc6cfb4e81fc19890d8e39fcbcd824939bc1582b23125924fc4c93efaa9eed&timestamp=1600653735766&ttl=1600660935766&type=lite&webhook=https%3A%2F%2F6d91b9be91c0.ngrok.io%2Ffinicity%2Fwebhook%2Ff6813bd1-1267-4853-bbea-b9c6e03971fc%3FAuthorization%3DeyJraWQiOiJ2eHYwZUZUZkt5QW1EZUdNZit6SW9HTWJDWmRGWTlcLytLRHpPbVh1UlpLUT0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJmNjgxM2JkMS0xMjY3LTQ4NTMtYmJlYS1iOWM2ZTAzOTcxZmMiLCJldmVudF9pZCI6IjgzN2FiNTlhLThmNjQtNGE1Ny1iMDkzLTA3ZmFjZTA1NWQ0ZCIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE2MDA2NTM3MzIsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC51cy1lYXN0LTEuYW1hem9uYXdzLmNvbVwvdXMtZWFzdC0xXzE2TlZMTkNkMyIsImV4cCI6MTYwMDY1NzMzMiwiaWF0IjoxNjAwNjUzNzMyLCJqdGkiOiI2ZDY4ZGRiYS01ZDM5LTQyY2QtYmZiMi1kNzFmYTI1NmVhYjIiLCJjbGllbnRfaWQiOiI3ZzdrcmZxMnRjZjh1cHFvcDZ0NDZxcjMyYSIsInVzZXJuYW1lIjoicWI1Wm9sVDlYODAwR0dLV25CVXEifQ.JoEYgZLgU88mvbxqbPuOa1SHT2C89WI-gDmRrczYVMXE63p9gRN_DC--37kTWVQ8tB-tAOqn8ad-AMk7kGQwePXUbItp5M1cAqRA3PyzMxJoLkwhXm8K2U4boHfO_LpP74QWf6-jtdlvUbC8EkixaSqwaQRrVuhx9oxTWdtyrSUMz97cE5hs7gU_XBtuHEr62L1OEH6dMoay_tM4ot9at_DdFRNgEbMI70eMDIVvBhAlfEKv44eY7vZ_ZXOX0wusnBuyiUEFyOYIYRUAlOPrgvw5Msdp_WR6h45TomLt024KUFc-RuBvKVvf_IoGp9gzWwvMR2VkW3gZNrw7FyziCQ&webhookContentType=application%2Fjson",
                )
                    .then((value) {
                  print(value);
                });
              },
              child: Text(
                "Test Finicity Connect",
              ),
            ),
            SizedBox(height: 24),
            Text("platform version: $platformVersion"),
          ],
        ),
      ),
    );
  }
}
