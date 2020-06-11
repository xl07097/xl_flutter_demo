import 'package:flutter/material.dart';

class StackTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("层叠布局 stack"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: Text('hello',style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              child: Text('jack'),
              left: 18.0,
              // top: 20.0,
            ),
            Positioned(
              child: Text("tom",),
              top: 18.0,
            )
          ],
        ),
      ),
    );
  }
}

class StackTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("层叠布局 stack"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Positioned(
              child: Text('jack'),
              left: 18.0,
              // top: 20.0,
            ),
            Container(
              child: Text('hello',style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              child: Text("tom",),
              top: 18.0,
            )
          ],
        ),
      ),
    );
  }
}

