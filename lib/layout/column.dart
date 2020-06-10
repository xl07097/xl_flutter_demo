import 'package:flutter/material.dart';

class ColumnTest extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("布局测试"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 主轴对其方式  占据最大空间
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("hello"),
              Text('world')
            ]
          ),
           // 主轴对其方式  不占据最大空间，对齐无意义
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("hello"),
              Text('world')
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text("hello"),
              Text('world')
            ]
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text("hello", style: TextStyle(fontSize: 30.0),),
              Text('world')
            ]
          ),
        ],
      ),
    );
  }
}

mixin MainAxizAlignment {
}