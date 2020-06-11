import 'package:flutter/material.dart';

class AlignTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("对齐相对定位"),
      ),
      body: Container(
        height: 200.0,
        width: 200.0,
        color: Colors.blue[50],
        child: Align(
          alignment: Alignment.topRight,
          child: FlutterLogo(
            size: 60
          ),
        ),
      )
    );
  }
}
