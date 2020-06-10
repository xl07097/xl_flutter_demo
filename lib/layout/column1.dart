import 'package:flutter/material.dart';

class Column3 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("布局测试"),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,  //有效，外层Colum高度为整个屏幕
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded( // 可以让内层的 column 占满容器
                child: Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,//无效，内层Colum高度为实际高度  
                    children:[
                      Text('txt'),
                      Text("world"),
                    ]
                  )
                )
              ),
              // Container(
              //   color: Colors.red,
              //   child: Column(
              //      mainAxisSize: MainAxisSize.max,//无效，内层Colum高度为实际高度  
              //      children:[
              //       Text('txt'),
              //       Text("world"),
              //      ]
              //   )
              // )
            ],
          ),
        )
      )
    );
  }
}
