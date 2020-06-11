import 'package:flutter/material.dart';

class ClipTest extends StatefulWidget {
  @override
  _ClipTest createState() => _ClipTest();
}

class _ClipTest extends State<ClipTest>{

  Widget avatar = Image.asset('static/photo.png', width: 60.0,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClipTest"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            avatar,
            ClipOval(child: avatar,),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: avatar,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[// 不会剪切
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 0.5,
                  child: avatar
                ),
                Text("I am jack")
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(  // 会剪切
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 0.5,
                    child: avatar,
                  ),
                ),
                Text("I am jack")
              ]
            )
          ],
        )
      ),
    );
  }
}
