import 'package:flutter/material.dart';

class PaddingTest extends StatelessWidget {
  const PaddingTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("填充容器"),
        actions: const <Widget>[
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50.0
              ),
              child: Container(
                height: 5.0,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                width: double.infinity,
                height: 40.0,
                color: Colors.blue[100],
                child: Text("jack"),
              ) ,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text("tom"),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0,18.0,40.0,23.0),
              child: Text("jim"),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text("tim"),
            ),
          ],
        ),
      ),
    );
  }
}
