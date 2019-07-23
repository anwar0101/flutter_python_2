import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() => runApp(CupertinoApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = const MethodChannel("flutter.shuvojit.com.channel");

  String _message = "No message yet";

  Future<String> _getmessage() async {
    String value;
    try {
      value = await platform.invokeMethod("callNative", "print('shuvojit')");
    } catch (e) {
      print(e);
    }
    return value;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _message,
              style: TextStyle(color: Colors.white),
            ),
            RaisedButton(
              onPressed: () {
                _getmessage().then((String msg) {
                  setState(() {
                    _message = msg;
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
