import 'package:flutter/material.dart';

class WillPopTest extends StatefulWidget {
  @override
  _WillPopTestState createState() => _WillPopTestState();
}

class _WillPopTestState extends State<WillPopTest> {
  DateTime _lasttime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_lasttime == null ||
              DateTime.now().difference(_lasttime) > Duration(seconds: 1)) {
            _lasttime = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        ),
      ),
    );
  }
}
