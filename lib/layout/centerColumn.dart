import 'package:flutter/material.dart';

class CenterColumnTest extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("布局测试"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('txt'),
          Text("world"),
        ],
      ),
    );
  }
}

mixin MainAxizAlignment {
}