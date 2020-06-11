import 'package:flutter/material.dart';

class PaddingTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("填充容器"),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ]
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50.0
              ),
              child: Container(
                height: 5.0,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Container(
                width: double.infinity,
                height: 40.0,
                color: Colors.blue[100],
                child: Text("jack"),
              ) ,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text("tom"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0,18.0,40.0,23.0),
              child: Text("jim"),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text("tim"),
            ),
          ],
        ),
      ),
    );
  }
}
